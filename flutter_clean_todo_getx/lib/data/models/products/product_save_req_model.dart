class ProductSaveReqModel {
  ProductSaveReqModel({
    this.productName,
    this.productPrice,
  });

  final String productName;
  final int productPrice;

  factory ProductSaveReqModel.fromJson(Map<String, dynamic> json) =>
      ProductSaveReqModel(
        productName: json["product_name"],
        productPrice: json["product_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_price": productPrice,
      };
}
