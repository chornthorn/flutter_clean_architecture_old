import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_point/domain/entities/products/product_search_req_entity.dart';
import 'package:get_point/domain/usecases/product/search_product_usecase.dart';

import '../../../core/errors/failure.dart';
import '../../../domain/entities/pagination_filter/pagination_filter.dart';
import '../../../domain/entities/products/product_delete_req_entity.dart';
import '../../../domain/entities/products/product_delete_res_entity.dart';
import '../../../domain/entities/products/product_list_res_entity.dart';
import '../../../domain/entities/products/product_save_req_entity.dart';
import '../../../domain/entities/products/product_save_res_entity.dart';
import '../../../domain/entities/products/product_update_req_entity.dart';
import '../../../domain/usecases/product/delete_product_usecase.dart';
import '../../../domain/usecases/product/get_product_list_usecase.dart';
import '../../../domain/usecases/product/save_product_usecase.dart';
import '../../../domain/usecases/product/update_product_usecase.dart';

class ProductController extends GetxController {
  final GetProductList _getProductList;
  final SaveProductUseCase _saveProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;
  final SearchProductUseCase _searchProductUseCase;

  ProductController({
    @required GetProductList getProductList,
    @required SaveProductUseCase saveProductUseCase,
    @required DeleteProductUseCase deleteProductUseCase,
    @required UpdateProductUseCase updateProductUseCase,
    @required SearchProductUseCase searchProductUseCase,
  })  : assert(getProductList != null),
        assert(saveProductUseCase != null),
        assert(deleteProductUseCase != null),
        assert(updateProductUseCase != null),
        assert(searchProductUseCase != null),
        _getProductList = getProductList,
        _saveProductUseCase = saveProductUseCase,
        _updateProductUseCase = updateProductUseCase,
        _searchProductUseCase = searchProductUseCase,
        _deleteProductUseCase = deleteProductUseCase;

  final _getProductData = <ProductResEntity>[].obs;

  List<ProductResEntity> get productResEntity => this._getProductData.value;

  Rx<ProductDeleteResEntity> _productDeleteSuccess =
      ProductDeleteResEntity().obs;

  ProductDeleteResEntity get productDeleteSuccess =>
      this._productDeleteSuccess.value;

  RxBool _isLoading = false.obs;

  bool get isLoading => this._isLoading.value;

  RxString _searchInputString = ''.obs;

  String get searchInputString => this._searchInputString.value;

  // Search product entity
  Rx<ProductSearchReqEntity> _searchProductReqEntity =
      ProductSearchReqEntity().obs;
  ProductSearchReqEntity get searchProductReqEntity =>
      this._searchProductReqEntity.value;

  // counter

  RxInt _counter = 0.obs;
  int get counter => this._counter.value;

  void increment() {
    this._counter++;
  }

  // TODO:: Implement Pagination here!
  RxBool _hasMore = true.obs;

  bool get hasMore => this._hasMore.value;
  final _lastPage = false.obs;
  Rx<PaginationFilter> _paginationFilter = PaginationFilter().obs;

  int get _page => _paginationFilter.value.page;

  bool get lastPage => _lastPage.value;

  final _scrollController = ScrollController();

  ScrollController get scrollController => this._scrollController;

  // TextEditingController here!
  final productNameTextEditController = TextEditingController();
  final productPriceTextEditController = TextEditingController();
  final searchTextEditController = TextEditingController();
  final _search = TextEditingController().obs;
  TextEditingController get search => this._search.value;

  @override
  void onInit() {
    ever(_paginationFilter, (_) => getProductFun()); // for every have changed
    _changePaginationFilter(1);
//    debounce(_search, (_) {
//      if (search.value.text.isNotEmpty) {
//        print('thorn');
//      } else {
//        _getProductData.clear();
//        this.getProductFun();
//      }
//    }, time: Duration(seconds: 1));
    debounce(_counter, (val) {
      print('counter work');
    }, time: Duration(seconds: 3));
    super.onInit();
  }

  /// Infinite scroll list view
  bool onNotification(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      this.nextPage();
    }

    return true;
  }

  void _changePaginationFilter(int page) {
    _paginationFilter.update((val) {
      val.page = page;
    });
  }

  void nextPage() => _changePaginationFilter(_page + 1);

  // Validate in search field
  void searchInputStringFun(String text) {
    this._searchInputString.value = text;
    _searchData(text);
  }

  void _searchData(String text) {
    print("Start search");
    _searchProductReqEntity.value.queryString = text;
    this.searchProductFun(reqEntity: _searchProductReqEntity.value);
  }

  // clear when use input query string search
  void queryStringClear() {
    this.search.clear(); // clear text field
    this.searchInputStringFun(
        ''); // clear string for check condition show remove icon
    this
        ._getProductData
        .clear(); // clear data that we used search that mean product will be 0 item
    this.getProductFun(); // get all product by paginate when we go to product list page
    return;
  }

  // search product response entities
  Future<void> searchProductFun({ProductSearchReqEntity reqEntity}) async {
    print('Searching !!!');
    this._isLoading.value = true;
    final _failureOrSuccess = await _searchProductUseCase(reqEntity);
    this._eitherSearchProductFailureOrSuccess(_failureOrSuccess);
    this._isLoading.value = false;
  }

  void _eitherSearchProductFailureOrSuccess(
      Either<Failure, List<ProductResEntity>> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return "Error";
    }, (value) {
      if (value.isEmpty) {
        _lastPage.value = true;
        _hasMore.value = false;
      }
      _getProductData.clear();
      _getProductData.value = value;
    });
  }

  // load product response entities
  Future<void> getProductFun() async {
    print('current page: $_page');
    print('refresh');
//    this._isLoading.value = true;
    final _failureOrSuccess = await _getProductList(_paginationFilter.value);
    this._eitherGetProductFailureOrSuccess(_failureOrSuccess);
//    this._isLoading.value = false;
  }

  void _eitherGetProductFailureOrSuccess(
      Either<Failure, List<ProductResEntity>> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return "Error";
    }, (value) {
      if (value.isEmpty) {
        _lastPage.value = true;
        _hasMore.value = false;
      }
      _getProductData.addAll(value);
    });
  }

  // Save product entities
  void saveProduct({ProductSaveReqEntity saveReqEntity}) async {
    this._isLoading.value = true;
    final _failureOrSuccess = await _saveProductUseCase(saveReqEntity);
    this._eitherSaveProductFailureOrSuccess(_failureOrSuccess);
    this._isLoading.value = false;
  }

  void _eitherSaveProductFailureOrSuccess(
      Either<Failure, ProductSaveResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      _buildAlertDialog(
        title: 'Warning !!!',
        message: l.toString(),
        color: Colors.red,
      );
    }, (value) {
      _buildAlertDialog(
        title: 'Message alert!',
        message: value.statusMessage.toString(),
        color: Colors.blue,
      );
      this._getProductData.clear();
      this.getProductFun();
      return;
    });
  }

  // connect to view
  void addProductByUser() {
    ProductSaveReqEntity reqEntity = ProductSaveReqEntity();
    reqEntity.productName = this.productNameTextEditController.text;
    reqEntity.productPrice =
        int.parse(this.productPriceTextEditController.text);
    this.saveProduct(saveReqEntity: reqEntity);
    Get.back();
  }

  // Delete product entities
  void deleteProduct({ProductDeleteReqEntity deleteReqEntity}) async {
    this._isLoading.value = true;
    final _failureOrSuccess = await _deleteProductUseCase(deleteReqEntity);
    this._eitherDeleteProductFailureOrSuccess(_failureOrSuccess);
    this._isLoading.value = false;
  }

  void _eitherDeleteProductFailureOrSuccess(
      Either<Failure, ProductDeleteResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      _buildAlertDialog(
        title: 'Warning !!!',
        message: l.toString(),
        color: Colors.red,
      );
    }, (value) {
      _buildAlertDialog(
        title: 'Message alert!',
        message: value.statusMessage.toString(),
        color: Colors.blue,
      );
      this.getProductFun();
      return this._productDeleteSuccess.value = value;
    });
  }

  // connect to view
  void deleteProductByUser(int id) {
    ProductDeleteReqEntity reqEntity = ProductDeleteReqEntity();
    reqEntity.productId = id;
    this.deleteProduct(deleteReqEntity: reqEntity);
    Get.back();
  }

  // Update product entities
  void updateProduct({ProductUpdateReqEntity productUpdateReqEntity}) async {
    this._isLoading.value = true;
    final _failureOrSuccess =
        await _updateProductUseCase(productUpdateReqEntity);
    this._eitherSaveProductFailureOrSuccess(_failureOrSuccess);
    this._isLoading.value = false;
  }

  // connect to view
  void updateProductByUser(int id) {
    ProductUpdateReqEntity reqEntity = ProductUpdateReqEntity();
    reqEntity.productId = id;
    reqEntity.productName = this.productNameTextEditController.text;
    reqEntity.productPrice =
        int.parse(this.productPriceTextEditController.text);
    this.updateProduct(productUpdateReqEntity: reqEntity);
    Get.back();
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

  /// ====================== * =================== ///

}
