import '../../../domain/entities/messages/message_res_entity.dart';

class MessageResModel extends MessageResEntity {
  MessageResModelPaging paging;
  List<MessageResModelData> data;
  int statusCode;
  String statusMessage;

  MessageResModel(
      {this.paging, this.data, this.statusCode, this.statusMessage});

  MessageResModel.fromJson(Map<String, dynamic> json) {
    paging = json['paging'] != null
        ? new MessageResModelPaging.fromJson(json['paging'])
        : null;
    if (json['data'] != null) {
      data = new List<MessageResModelData>();
      json['data'].forEach((v) {
        data.add(new MessageResModelData.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}

class MessageResModelPaging extends MessageResPaging {
  int pageNo;
  int pageSize;
  int totalPage;
  int totalRecord;

  MessageResModelPaging(
      {this.pageNo, this.pageSize, this.totalPage, this.totalRecord});

  MessageResModelPaging.fromJson(Map<String, dynamic> json) {
    pageNo = json['page_no'];
    pageSize = json['page_size'];
    totalPage = json['total_page'];
    totalRecord = json['total_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_no'] = this.pageNo;
    data['page_size'] = this.pageSize;
    data['total_page'] = this.totalPage;
    data['total_record'] = this.totalRecord;
    return data;
  }
}

class MessageResModelData extends MessageResDataEntity {
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

  MessageResModelData(
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

  MessageResModelData.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    userName = json['userName'];
    moduleName = json['moduleName'];
    messageSubject = json['messageSubject'];
    messageTitle = json['messageTitle'];
    messageBody = json['messageBody'];
    messageStatus = json['messageStatus'];
    messageCircleAvatar = json['messageCircleAvatar'];
    createdDate = DateTime.parse(json["createdDate"]);
    updatedDate = DateTime.parse(json["updatedDate"]);
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
