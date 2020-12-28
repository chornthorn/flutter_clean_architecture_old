import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_point/domain/entities/products/product_search_req_entity.dart';

import '../../../core/core.dart';
import '../../entities/products/product_list_res_entity.dart';
import '../../repositories/product_repository.dart';

class SearchProductUseCase
    implements UseCase<List<ProductResEntity>, ProductSearchReqEntity> {
  final ProductRepository _repository;

  SearchProductUseCase({@required ProductRepository productRepository})
      : assert(productRepository != null),
        _repository = productRepository;

  @override
  Future<Either<Failure, List<ProductResEntity>>> call(
      ProductSearchReqEntity params) async {
    return await _repository.searchProduct(productSearchReqEntity: params);
  }
}
