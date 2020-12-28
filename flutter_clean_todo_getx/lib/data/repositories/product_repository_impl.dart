import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_point/domain/entities/products/product_search_req_entity.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/pagination_filter/pagination_filter.dart';
import '../../domain/entities/products/product_delete_req_entity.dart';
import '../../domain/entities/products/product_delete_res_entity.dart';
import '../../domain/entities/products/product_list_res_entity.dart';
import '../../domain/entities/products/product_save_req_entity.dart';
import '../../domain/entities/products/product_save_res_entity.dart';
import '../../domain/entities/products/product_update_req_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/remote/product/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _dataSource;

  ProductRepositoryImpl(
      {@required ProductRemoteDataSource productRemoteDataSource})
      : assert(productRemoteDataSource != null),
        _dataSource = productRemoteDataSource;

  @override
  Future<Either<Failure, List<ProductResEntity>>> getProductList(
      {PaginationFilter page}) async {
    try {
      final _r = await _dataSource.getProductList(page: page);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductSaveResEntity>> saveProduct(
      {ProductSaveReqEntity productSaveReqEntity}) async {
    try {
      final _r = await _dataSource.saveProduct(
          productSaveReqModel: productSaveReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductDeleteResEntity>> deleteProduct(
      {ProductDeleteReqEntity productDeleteReqEntity}) async {
    try {
      final _r = await _dataSource.deleteProduct(
          productDeleteReqModel: productDeleteReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductSaveResEntity>> updateProduct(
      {ProductUpdateReqEntity productUpdateReqEntity}) async {
    try {
      final _r = await _dataSource.updateProduct(
          productUpdateReqEntity: productUpdateReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductResEntity>>> searchProduct(
      {ProductSearchReqEntity productSearchReqEntity}) async {
    try {
      final _r =
          await _dataSource.searchProduct(reqModel: productSearchReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
