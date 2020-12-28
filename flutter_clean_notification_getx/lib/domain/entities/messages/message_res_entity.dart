import 'package:equatable/equatable.dart';

import '../../../data/models/messages/message_res_model.dart';

class MessageResEntity extends Equatable {
  final List<MessageResModelData> data;
  final int statusCode;
  final String statusMessage;
  final MessageResModelPaging paging;

  MessageResEntity({
    this.data,
    this.statusCode,
    this.statusMessage,
    this.paging,
  });

  @override
  List<Object> get props => [data, statusCode, statusMessage, paging];
}

class MessageResDataEntity extends Equatable {
  MessageResDataEntity({
    this.messageId,
    this.userName,
    this.moduleName,
    this.messageSubject,
    this.messageTitle,
    this.messageBody,
    this.messageStatus,
    this.createdDate,
    this.updatedDate,
    this.createdDateStr,
    this.updatedDateStr,
    this.dateShow,
    this.messageCircleAvatar,
  });

  String messageId;
  String userName;
  String moduleName;
  String messageSubject;
  String messageTitle;
  String messageBody;
  String messageStatus;
  String messageCircleAvatar;
  DateTime createdDate;
  DateTime updatedDate;
  String createdDateStr;
  String updatedDateStr;
  String dateShow;

  @override
  List<Object> get props => [
        messageId,
        userName,
        moduleName,
        messageSubject,
        messageTitle,
        messageBody,
        createdDate,
        updatedDate,
        createdDateStr,
        updatedDateStr,
        dateShow,
        messageCircleAvatar,
      ];
}

class MessageResPaging {
  int pageNo;
  int pageSize;
  int totalPage;
  int totalRecord;

  MessageResPaging({
    this.pageNo,
    this.pageSize,
    this.totalPage,
    this.totalRecord,
  });
}
