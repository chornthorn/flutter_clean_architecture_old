import 'package:get_point/data/models/products/product_search_req_model.dart';

class ProductSearchReqEntity extends ProductSearchReqModel {
  String queryString;
  int page;

  ProductSearchReqEntity({this.queryString});
}
