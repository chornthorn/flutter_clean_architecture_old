

class MessageReadReqModel {
  MessageReadReqModelData data;
  String entrypFlag;

  MessageReadReqModel({this.data, this.entrypFlag});

  MessageReadReqModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new MessageReadReqModelData.fromJson(json['data'])
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

class MessageReadReqModelData {
  String messageId;
  String userName;
  String moduleName;

  MessageReadReqModelData({this.messageId, this.userName, this.moduleName});

  MessageReadReqModelData.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    userName = json['userName'];
    moduleName = json['moduleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this.messageId;
    data['userName'] = this.userName;
    data['moduleName'] = this.moduleName;
    return data;
  }
}
