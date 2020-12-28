import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../data/datasource/remote/messages/message_remote_datasource.dart';
import '../../../../data/repositories/message_repository_impl.dart';
import '../../../../domain/entities/messages/message_delete_req_entity.dart';
import '../../../../domain/entities/messages/message_delete_res_entity.dart';
import '../../../../domain/entities/messages/message_read_req_entity.dart';
import '../../../../domain/entities/messages/message_read_res_entity.dart';
import '../../../../domain/entities/messages/message_req_entity.dart';
import '../../../../domain/entities/messages/message_res_entity.dart';
import '../../../../domain/entities/messages/message_update_req_entity.dart';
import '../../../../domain/entities/messages/message_update_res_entity.dart';
import '../../../../domain/repositories/message_repository.dart';
import '../../../../domain/usecases/messages/delete_message_usecase.dart';
import '../../../../domain/usecases/messages/get_message_usecase.dart';
import '../../../../domain/usecases/messages/read_message_usecase.dart';
import '../../../../domain/usecases/messages/update_message_usecase.dart';

part '../../binding/home_binding.dart';

class HomeController extends GetxController {
  final GetMessageUseCase _getMessageUseCase;
  final ReadMessageUseCase _readMessageUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;
  final UpdateMessageUseCase _updateMessageUseCase;

  HomeController({
    @required GetMessageUseCase getMessageUseCase,
    @required ReadMessageUseCase readMessageUseCase,
    @required DeleteMessageUseCase deleteMessageUseCase,
    @required UpdateMessageUseCase updateMessageUseCase,
  })  : assert(getMessageUseCase != null),
        assert(readMessageUseCase != null),
        assert(deleteMessageUseCase != null),
        assert(updateMessageUseCase != null),
        _readMessageUseCase = readMessageUseCase,
        _deleteMessageUseCase = deleteMessageUseCase,
        _updateMessageUseCase = updateMessageUseCase,
        _getMessageUseCase = getMessageUseCase;

  final _messageResEntity = <MessageResDataEntity>[].obs;
  List<MessageResDataEntity> get messageResEntity =>
      this._messageResEntity.value;

  final _readMessage = MessageReadResEntity().obs;
  MessageReadResEntity get readMessage => this._readMessage.value;

  final _deleteMessage = MessageDeleteResEntity().obs;
  MessageDeleteResEntity get deleteMessage => this._deleteMessage.value;

  final _pagingRes = MessageResPaging().obs;
  MessageResPaging get pagingRes => this._pagingRes.value;

  RxBool _isLoading = false.obs;
  bool get isLoading => this._isLoading.value;

  ///
  final _search = TextEditingController().obs;
  TextEditingController get search => this._search.value;

  RxString _searchInputString = ''.obs;

  String get searchInputString => this._searchInputString.value;

  ///
  RxBool _hasMore = true.obs;

  bool get hasMore => this._hasMore.value;
  final _lastPage = false.obs;

  Rx<MessageReqDataEntity> _paginationFilter = MessageReqDataEntity().obs;
  MessageReqDataEntity get paginationFilter => this._paginationFilter.value;

  int get _page => _paginationFilter.value.pageNo;

  bool get lastPage => _lastPage.value;

  final _scrollController = ScrollController();

  ScrollController get scrollController => this._scrollController;

  // string filter
  final _messageStatusSelected = ''.obs;

  @override
  void onInit() {
    ever(_paginationFilter, (_) => getMessageFun());
    this._changePaginationFilter(1);
    debounce(_searchInputString, (String search) {
      if (search.length > 2) {
        this.filterOrSearchMessageFun(
          search: search,
          messageStatus: _messageStatusSelected.value,
        );
      }
    }, time: Duration(microseconds: 300));
    super.onInit();
  }

  // pagination

  /// Infinite scroll list view
  bool onNotification(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      if (_page < _pagingRes.value.totalPage) {
        this.nextPage();
      } else {
        _hasMore.value = false;
      }
    }
    return true;
  }

  void nextPage() {
    _changePaginationFilter(_page + 1);
  }

  void _changePaginationFilter(int page) {
    _paginationFilter.update((val) {
      val.pageNo = page;
    });
  }

  // Validate in search field
  void searchInputStringFun(String text) {
    this._searchInputString.value = text;
  }

  // clear when use input query string search
  void queryStringClear() {
    this.search.clear(); // clear text field
    this.searchInputStringFun('');
    this.onChangedSearchField('');
    this.pullRefreshMessageFun();
  }

  // filter with search
  onChangedSearchField(value) {
    this.filterOrSearchMessageFun(
      messageStatus: value,
      search: _searchInputString.value,
    );
  }

  // load message response entities
  Future<void> getMessageFun({String search, String messageStatus}) async {
    print('current page: $_page');

    _paginationFilter.value.keySearch = search ?? "";
    _paginationFilter.value.userName = "admin";
    _paginationFilter.value.moduleName = "IA";
    _paginationFilter.value.messageStatus = messageStatus ?? "";
    _paginationFilter.value.pageSize = 10;
//    _paginationFilter.value.pageNo = _page;

//    this._isLoading.value = true;
    final _failureOrSuccess = await _getMessageUseCase(_paginationFilter.value);
    this._eitherGetMessageFailureOrSuccess(_failureOrSuccess);
//    this._isLoading.value = false;
  }

  void _eitherGetMessageFailureOrSuccess(
      Either<Failure, MessageResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (response) {
      if (response.statusCode == 200) {
        this._pagingRes.value = response.paging;
        this._messageResEntity.addAll(response.data);
      } else if (response.statusCode == 204) {
//        _hasMore.value = false;
        _messageResEntity.value = [];
      } else {
        _messageResEntity.value = [];
      }
    });
  }

  //  pull refresh
  Future<void> pullRefreshMessageFun() async {
    _paginationFilter.value.keySearch = "";
    _paginationFilter.value.userName = "admin";
    _paginationFilter.value.moduleName = "IA";
    _paginationFilter.value.messageStatus = "";
    _paginationFilter.value.pageSize = 10;
    _paginationFilter.value.pageNo = 1;

    this._isLoading.value = true;
    final _failureOrSuccess = await _getMessageUseCase(_paginationFilter.value);
    this._eitherFilterOrSearchMessageFailureOrSuccess(_failureOrSuccess);
    this._isLoading.value = false;

    print('pull refresh');
  }

  //  update refresh
  Future<void> updateRefreshMessageFun() async {
    _paginationFilter.value.keySearch = "";
    _paginationFilter.value.userName = "admin";
    _paginationFilter.value.moduleName = "IA";
    _paginationFilter.value.messageStatus = "";
    _paginationFilter.value.pageSize = 10;
    _paginationFilter.value.pageNo = 1;
    final _failureOrSuccess = await _getMessageUseCase(_paginationFilter.value);
    this._eitherFilterOrSearchMessageFailureOrSuccess(_failureOrSuccess);
  }

  // filter message by status
  Future<void> filterOrSearchMessageFun(
      {String messageStatus, String search}) async {
    _paginationFilter.value.keySearch = search ?? "";
    _paginationFilter.value.userName = "admin";
    _paginationFilter.value.moduleName = "IA";
    _paginationFilter.value.messageStatus = messageStatus ?? "";
    _paginationFilter.value.pageSize = 10;
    _paginationFilter.value.pageNo = 1;

    this._messageStatusSelected.value = messageStatus;

    this._isLoading.value = true;
    final _failureOrSuccess = await _getMessageUseCase(_paginationFilter.value);

    this._eitherFilterOrSearchMessageFailureOrSuccess(_failureOrSuccess);
    this._isLoading.value = false;
  }

  void _eitherFilterOrSearchMessageFailureOrSuccess(
      Either<Failure, MessageResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (response) {
      if (response.statusCode == 200) {
        this._pagingRes.value = response.paging;
        if (response.data.isEmpty) {
          _hasMore.value = false;
        }
        this._messageResEntity.value = response.data;
      } else if (response.statusCode == 204) {
        _messageResEntity.value = [];
      } else {
        _messageResEntity.value = [];
      }
    });
  }

  // read message response entities
  Future<void> readMessageFun({@required String messageId}) async {
    MessageReadReqEntity reqDataEntity = MessageReadReqEntity();
    reqDataEntity.messageId = messageId;
    reqDataEntity.userName = "admin";
    reqDataEntity.moduleName = "IA";

    this._isLoading.value = true;
    final _failureOrSuccess = await _readMessageUseCase(reqDataEntity);
    this._eitherReadMessageFailureOrSuccess(_failureOrSuccess);
    this._isLoading.value = false;
  }

  void _eitherReadMessageFailureOrSuccess(
      Either<Failure, MessageReadResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (value) {
      return _readMessage.value = value;
    });
  }

  // delete message response entities
  Future<void> deleteMessageFun({@required String messageId}) async {
    MessageDeleteReqEntity reqDataEntity = MessageDeleteReqEntity();
    reqDataEntity.messageId = messageId;
    reqDataEntity.userName = "admin";
    reqDataEntity.moduleName = "IA";
    final _failureOrSuccess = await _deleteMessageUseCase(reqDataEntity);
    this._eitherDeleteMessageFailureOrSuccess(_failureOrSuccess);
  }

  void _eitherDeleteMessageFailureOrSuccess(
      Either<Failure, MessageDeleteResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (value) {
//      return _deleteMessage.value = value;
      _buildAlertDialog(
        title: 'Message!',
        color: Colors.green,
        message: value.statusMessage.toString(),
      );
      this.pullRefreshMessageFun();
    });
  }

  // update message response entities
  Future<void> updateMessageFun({
    @required String messageId,
    @required String messageStatus,
  }) async {
    MessageUpdateReqEntity reqDataEntity = MessageUpdateReqEntity();
    reqDataEntity.messageId = messageId;
    reqDataEntity.userName = "admin";
    reqDataEntity.moduleName = "IA";
    reqDataEntity.messageStatus = messageStatus;
    final _failureOrSuccess = await _updateMessageUseCase(reqDataEntity);
    this._eitherUpdateMessageFailureOrSuccess(_failureOrSuccess);
  }

  void _eitherUpdateMessageFailureOrSuccess(
      Either<Failure, MessageUpdateResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (value) {
//      _buildAlertDialog(
//        title: 'Message!',
//        color: Colors.green,
//        message: value.statusMessage.toString(),
//      );
      this.updateRefreshMessageFun();
    });
  }

  // User click

  void onSlideMessage(String id, String m) {
    if (m == 'R') {
      this.updateMessageFun(messageId: id, messageStatus: m);
    } else {
      this.updateMessageFun(messageId: id, messageStatus: m);
    }
  }

  // onTap on ListTile

  void onTapListTile(String id, String arg) {
    this.readMessageFun(messageId: id);
    this.updateRefreshMessageFun();
    Get.toNamed('/email_detail', arguments: arg);
  }

  // custom alert dialog
  void _buildAlertDialog({
    String title,
    String message,
    Color color,
  }) {
    Get.snackbar(
      '$title',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
    );
  }
}
