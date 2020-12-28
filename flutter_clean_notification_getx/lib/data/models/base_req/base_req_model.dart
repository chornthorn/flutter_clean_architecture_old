import 'paginate_req_model.dart';

class BaseReqModel {
  BaseReqModel({
    this.paging,
    this.entrypFlag,
  });

  final PagingReqModel paging;
  final String entrypFlag;

  factory BaseReqModel.fromJson(Map<String, dynamic> json) => BaseReqModel(
        paging: PagingReqModel.fromJson(json["paging"]),
        entrypFlag: json["entryp_flag"],
      );

  Map<String, dynamic> toJson() => {
        "paging": paging.toJson(),
        "entryp_flag": entrypFlag,
      };
}
