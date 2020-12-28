import '../../../data/models/products/product_save_req_model.dart';

class ProductSaveReqEntity extends ProductSaveReqModel {
  ProductSaveReqEntity({
    this.productName,
    this.productPrice,
  });

  String productName;
  int productPrice;
}
