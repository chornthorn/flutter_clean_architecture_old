import '../../../domain/entities/products/product_save_res_entity.dart';

class ProductSaveResModel extends ProductSaveResEntity {
  ProductSaveResModel({
    this.statusMessage,
  });

  final String statusMessage;

  factory ProductSaveResModel.fromJson(Map<String, dynamic> json) =>
      ProductSaveResModel(
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusMessage": statusMessage,
      };
}
