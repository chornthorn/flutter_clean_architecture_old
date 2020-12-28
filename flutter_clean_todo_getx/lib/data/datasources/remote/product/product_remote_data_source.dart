import 'dart:convert';

import 'package:get_point/data/models/products/product_search_req_model.dart';

import '../../../../core/core.dart';
import '../../../../domain/entities/pagination_filter/pagination_filter.dart';
import '../../../../domain/entities/products/product_delete_res_entity.dart';
import '../../../../domain/entities/products/product_list_res_entity.dart';
import '../../../../domain/entities/products/product_save_res_entity.dart';
import '../../../../domain/entities/products/product_update_req_entity.dart';
import '../../../models/products/product_delete_req_model.dart';
import '../../../models/products/product_delete_res_model.dart';
import '../../../models/products/product_res_model.dart';
import '../../../models/products/product_save_req_model.dart';
import '../../../models/products/product_save_res_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductResEntity>> getProductList({PaginationFilter page});

  Future<ProductSaveResEntity> saveProduct(
      {ProductSaveReqModel productSaveReqModel});

  Future<ProductDeleteResEntity> deleteProduct(
      {ProductDeleteReqModel productDeleteReqModel});

  Future<ProductSaveResEntity> updateProduct(
      {ProductUpdateReqEntity productUpdateReqEntity});

  Future<List<ProductResEntity>> searchProduct(
      {ProductSearchReqModel reqModel});
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  CustomHttp _http = CustomHttp();
  var path = "$BASE_URL/product";

  @override
  Future<List<ProductResEntity>> getProductList({PaginationFilter page}) async {
    var pageNumber = page.page;
    var response = await _http.getRequest(path: '$path?page=$pageNumber');
    var res = ProductResModel.fromJson(response);
    return res.data;
  }

  @override
  Future<ProductSaveResEntity> saveProduct(
      {ProductSaveReqModel productSaveReqModel}) async {
    var body = json.encode(productSaveReqModel);
    var response = await _http.postRequest(path: path, body: body);
    return ProductSaveResModel.fromJson(response);
  }

  @override
  Future<ProductDeleteResEntity> deleteProduct(
      {ProductDeleteReqModel productDeleteReqModel}) async {
    var id = productDeleteReqModel.productId;
    final response = await _http.deleteRequest(path: '$path/$id');
    return ProductDeleteResModel.fromJson(response);
  }

  @override
  Future<ProductSaveResEntity> updateProduct(
      {ProductUpdateReqEntity productUpdateReqEntity}) async {
    var id = productUpdateReqEntity.productId;
    var body = json.encode(productUpdateReqEntity);
    final response = await _http.putRequest(path: '$path/$id', body: body);
    return ProductSaveResModel.fromJson(response);
  }

  @override
  Future<List<ProductResEntity>> searchProduct(
      {ProductSearchReqModel reqModel}) async {
    var pageNumber = reqModel.page;
    var _path = "$BASE_URL/search_product?page=$pageNumber";
    var body = json.encode(reqModel);
    var response = await _http.postRequest(path: _path, body: body);
    return ProductResModel.fromJson(response).data;
  }
}
