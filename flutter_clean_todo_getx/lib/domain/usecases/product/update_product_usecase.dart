import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../entities/products/product_save_res_entity.dart';
import '../../entities/products/product_update_req_entity.dart';
import '../../repositories/product_repository.dart';

class UpdateProductUseCase
    implements UseCase<ProductSaveResEntity, ProductUpdateReqEntity> {
  final ProductRepository _repository;

  UpdateProductUseCase({@required ProductRepository productRepository})
      : assert(productRepository != null),
        _repository = productRepository;
  @override
  Future<Either<Failure, ProductSaveResEntity>> call(
      ProductUpdateReqEntity params) async {
    return await _repository.updateProduct(productUpdateReqEntity: params);
  }
}
