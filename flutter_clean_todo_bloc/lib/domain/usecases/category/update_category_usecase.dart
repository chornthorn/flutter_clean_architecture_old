import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

class UpdateCategoryUseCase
    implements UseCase<CategorySaveResEntity, CategorySaveReqEntity> {
  final CategoryRepository _categoryRepository;

  UpdateCategoryUseCase({@required CategoryRepository categoryRepository})
      : assert(categoryRepository != null),
        _categoryRepository = categoryRepository;
  @override
  Future<Either<Failure, CategorySaveResEntity>> call(
      CategorySaveReqEntity reqEntity) async {
    return await _categoryRepository.updateCategory(reqEntity);
  }
}
