import 'package:dartz/dartz.dart';
import 'package:get_point/domain/entities/products/product_search_req_entity.dart';

import '../../core/core.dart';
import '../entities/pagination_filter/pagination_filter.dart';
import '../entities/products/product_delete_req_entity.dart';
import '../entities/products/product_delete_res_entity.dart';
import '../entities/products/product_list_res_entity.dart';
import '../entities/products/product_save_req_entity.dart';
import '../entities/products/product_save_res_entity.dart';
import '../entities/products/product_update_req_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductResEntity>>> getProductList(
      {PaginationFilter page});
  Future<Either<Failure, ProductSaveResEntity>> saveProduct(
      {ProductSaveReqEntity productSaveReqEntity});
  Future<Either<Failure, ProductDeleteResEntity>> deleteProduct(
      {ProductDeleteReqEntity productDeleteReqEntity});
  Future<Either<Failure, ProductSaveResEntity>> updateProduct(
      {ProductUpdateReqEntity productUpdateReqEntity});
  Future<Either<Failure, List<ProductResEntity>>> searchProduct(
      {ProductSearchReqEntity productSearchReqEntity});
}
