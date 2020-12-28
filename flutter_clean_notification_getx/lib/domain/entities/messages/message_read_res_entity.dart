import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MessageReadResEntity extends Equatable {
  String messageId;
  String userName;
  String moduleName;
  String messageSubject;
  String messageTitle;
  String messageBody;
  String messageStatus;
  String messageCircleAvatar;
  String createdDate;
  String updatedDate;
  String createdDateStr;
  String updatedDateStr;
  String dateShow;

  MessageReadResEntity(
      {this.messageId,
      this.userName,
      this.moduleName,
      this.messageSubject,
      this.messageTitle,
      this.messageBody,
      this.messageStatus,
      this.messageCircleAvatar,
      this.createdDate,
      this.updatedDate,
      this.createdDateStr,
      this.updatedDateStr,
      this.dateShow});

  @override
  List<Object> get props => [
        messageId,
        userName,
        moduleName,
        messageSubject,
        messageTitle,
        messageBody,
        messageStatus,
        messageCircleAvatar,
        createdDate,
        updatedDate,
        createdDateStr,
        updatedDateStr,
        dateShow,
      ];
}
