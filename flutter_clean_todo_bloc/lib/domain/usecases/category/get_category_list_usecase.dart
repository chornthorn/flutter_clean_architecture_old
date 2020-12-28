import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

class GetCategoryListUseCase
    implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository _categoryRepository;

  GetCategoryListUseCase({@required CategoryRepository categoryRepository})
      : assert(categoryRepository != null),
        _categoryRepository = categoryRepository;
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await _categoryRepository.getCategories();
  }
}
