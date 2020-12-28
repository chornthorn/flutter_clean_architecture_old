import '../../../domain/entities/messages/message_read_res_entity.dart';

class MessageReadResModel {
  MessageReadResModelData data;
  int statusCode;
  String statusMessage;

  MessageReadResModel({this.data, this.statusCode, this.statusMessage});

  MessageReadResModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new MessageReadResModelData.fromJson(json['data'])
        : null;
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}

// ignore: must_be_immutable
class MessageReadResModelData extends MessageReadResEntity {
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

  MessageReadResModelData(
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

  MessageReadResModelData.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    userName = json['userName'];
    moduleName = json['moduleName'];
    messageSubject = json['messageSubject'];
    messageTitle = json['messageTitle'];
    messageBody = json['messageBody'];
    messageStatus = json['messageStatus'];
    messageCircleAvatar = json['messageCircleAvatar'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    createdDateStr = json['createdDateStr'];
    updatedDateStr = json['updatedDateStr'];
    dateShow = json['dateShow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this.messageId;
    data['userName'] = this.userName;
    data['moduleName'] = this.moduleName;
    data['messageSubject'] = this.messageSubject;
    data['messageTitle'] = this.messageTitle;
    data['messageBody'] = this.messageBody;
    data['messageStatus'] = this.messageStatus;
    data['messageCircleAvatar'] = this.messageCircleAvatar;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['createdDateStr'] = this.createdDateStr;
    data['updatedDateStr'] = this.updatedDateStr;
    data['dateShow'] = this.dateShow;
    return data;
  }
}
