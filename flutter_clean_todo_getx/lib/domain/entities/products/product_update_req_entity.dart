import '../../../data/models/products/product_save_req_model.dart';

class ProductUpdateReqEntity extends ProductSaveReqModel {
  ProductUpdateReqEntity({
    this.productName,
    this.productPrice,
    this.productId,
  });

  String productName;
  int productPrice;
  int productId;
}
