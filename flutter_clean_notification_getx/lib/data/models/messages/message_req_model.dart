class MessageReqModel {
  MessageReqModelData data;
  MessageReqModelPaging paging;
  String entrypFlag;

  MessageReqModel({this.data, this.paging, this.entrypFlag});

  MessageReqModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new MessageReqModelData.fromJson(json['data'])
        : null;
    paging = json['paging'] != null
        ? new MessageReqModelPaging.fromJson(json['paging'])
        : null;
    entrypFlag = json['entryp_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    data['entryp_flag'] = this.entrypFlag;
    return data;
  }
}

class MessageReqModelData {
  String keySearch;
  String userName;
  String moduleName;
  String messageStatus;

  MessageReqModelData(
      {this.keySearch, this.userName, this.moduleName, this.messageStatus});

  MessageReqModelData.fromJson(Map<String, dynamic> json) {
    keySearch = json['keySearch'];
    userName = json['userName'];
    moduleName = json['moduleName'];
    messageStatus = json['messageStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keySearch'] = this.keySearch;
    data['userName'] = this.userName;
    data['moduleName'] = this.moduleName;
    data['messageStatus'] = this.messageStatus;
    return data;
  }
}

class MessageReqModelPaging {
  int pageNo;
  int pageSize;

  MessageReqModelPaging({this.pageNo, this.pageSize});

  MessageReqModelPaging.fromJson(Map<String, dynamic> json) {
    pageNo = json['page_no'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_no'] = this.pageNo;
    data['page_size'] = this.pageSize;
    return data;
  }
}
