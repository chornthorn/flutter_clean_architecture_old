import 'paginate_res_model.dart';

class BaseResModel {
  PagingResModel paging;
  int statusCode;
  String statusMessage;

  BaseResModel({this.paging, this.statusCode, this.statusMessage});

  BaseResModel.fromJson(Map<String, dynamic> json) {
    paging = json['paging'] != null
        ? new PagingResModel.fromJson(json['paging'])
        : null;
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}
