import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../entities/products/product_delete_req_entity.dart';
import '../../entities/products/product_delete_res_entity.dart';
import '../../repositories/product_repository.dart';

class DeleteProductUseCase
    implements UseCase<ProductDeleteResEntity, ProductDeleteReqEntity> {
  final ProductRepository _repository;

  DeleteProductUseCase({@required ProductRepository productRepository})
      : assert(productRepository != null),
        _repository = productRepository;
  @override
  Future<Either<Failure, ProductDeleteResEntity>> call(
      ProductDeleteReqEntity params) async {
    return await _repository.deleteProduct(productDeleteReqEntity: params);
  }
}
