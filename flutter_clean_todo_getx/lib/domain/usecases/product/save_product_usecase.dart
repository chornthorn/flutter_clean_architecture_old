import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../entities/products/product_save_req_entity.dart';
import '../../entities/products/product_save_res_entity.dart';
import '../../repositories/product_repository.dart';

class SaveProductUseCase
    implements UseCase<ProductSaveResEntity, ProductSaveReqEntity> {
  final ProductRepository _repository;

  SaveProductUseCase({@required ProductRepository productRepository})
      : assert(productRepository != null),
        _repository = productRepository;
  @override
  Future<Either<Failure, ProductSaveResEntity>> call(
      ProductSaveReqEntity params) async {
    return await _repository.saveProduct(productSaveReqEntity: params);
  }
}
