class PagingReqModel {
  PagingReqModel({
    this.pageNo,
    this.pageSize,
  });

  final int pageNo;
  final int pageSize;

  factory PagingReqModel.fromJson(Map<String, dynamic> json) => PagingReqModel(
        pageNo: json["page_no"],
        pageSize: json["page_size"],
      );

  Map<String, dynamic> toJson() => {
        "page_no": pageNo,
        "page_size": pageSize,
      };
}
