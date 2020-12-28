import '../../../domain/entities/products/product_delete_res_entity.dart';

class ProductDeleteResModel extends ProductDeleteResEntity {
  ProductDeleteResModel({
    this.statusMessage,
  });

  final String statusMessage;

  factory ProductDeleteResModel.fromJson(Map<String, dynamic> json) =>
      ProductDeleteResModel(
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusMessage": statusMessage,
      };
}
