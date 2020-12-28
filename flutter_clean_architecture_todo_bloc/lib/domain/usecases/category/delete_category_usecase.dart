import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

class DeleteCategoryUseCase
    implements UseCase<CategoryDeleteResEntity, CategoryDeleteReqEntity> {
  final CategoryRepository _categoryRepository;

  DeleteCategoryUseCase({@required CategoryRepository categoryRepository})
      : assert(categoryRepository != null),
        _categoryRepository = categoryRepository;
  @override
  Future<Either<Failure, CategoryDeleteResEntity>> call(
      CategoryDeleteReqEntity reqEntity) async {
    return await _categoryRepository.deleteCategory(reqEntity);
  }
}
