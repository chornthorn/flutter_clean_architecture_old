class MessageUpdateReqModel {
  MessageUpdateReqModelData data;
  String entrypFlag;

  MessageUpdateReqModel({this.data, this.entrypFlag});

  MessageUpdateReqModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new MessageUpdateReqModelData.fromJson(json['data'])
        : null;
    entrypFlag = json['entryp_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['entryp_flag'] = this.entrypFlag;
    return data;
  }
}

class MessageUpdateReqModelData {
  String messageId;
  String userName;
  String moduleName;
  String messageStatus;

  MessageUpdateReqModelData(
      {this.messageId, this.userName, this.moduleName, this.messageStatus});

  MessageUpdateReqModelData.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    userName = json['userName'];
    moduleName = json['moduleName'];
    messageStatus = json['messageStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this.messageId;
    data['userName'] = this.userName;
    data['moduleName'] = this.moduleName;
    data['messageStatus'] = this.messageStatus;
    return data;
  }
}
