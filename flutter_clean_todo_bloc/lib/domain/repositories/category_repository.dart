import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domain.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, CategorySaveResEntity>> saveCategory(
      CategorySaveReqEntity reqEntity);
  Future<Either<Failure, CategoryDeleteResEntity>> deleteCategory(
      CategoryDeleteReqEntity reqEntity);
  Future<Either<Failure, CategorySaveResEntity>> updateCategory(
      CategorySaveReqEntity reqEntity);
}
