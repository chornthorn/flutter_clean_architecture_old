class ProductDeleteReqModel {
  ProductDeleteReqModel({
    this.productId,
  });

  final int productId;

  factory ProductDeleteReqModel.fromJson(Map<String, dynamic> json) =>
      ProductDeleteReqModel(
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
      };
}
