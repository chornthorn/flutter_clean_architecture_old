class ProductSearchReqModel {
  ProductSearchReqModel({
    this.queryString,
    this.page,
  });

  final String queryString;
  int page;

  factory ProductSearchReqModel.fromJson(Map<String, dynamic> json) =>
      ProductSearchReqModel(
        queryString: json["query_string"],
      );

  Map<String, dynamic> toJson() => {
        "query_string": queryString,
      };
}
