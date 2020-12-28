import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import '../../entities/pagination_filter/pagination_filter.dart';
import '../../entities/products/product_list_res_entity.dart';
import '../../repositories/product_repository.dart';

class GetProductList
    implements UseCase<List<ProductResEntity>, PaginationFilter> {
  final ProductRepository _repository;

  GetProductList({@required ProductRepository productRepository})
      : assert(productRepository != null),
        _repository = productRepository;

  @override
  Future<Either<Failure, List<ProductResEntity>>> call(
      PaginationFilter params) async {
    return await _repository.getProductList(page: params);
  }
}
