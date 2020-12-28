import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    @required GetCategoryListUseCase getCategoryListUseCase,
    @required SaveCategoryListUseCase saveCategoryListUseCase,
    @required DeleteCategoryUseCase deleteCategoryUseCase,
    @required UpdateCategoryUseCase updateCategoryUseCase,
  })  : assert(getCategoryListUseCase != null),
        assert(saveCategoryListUseCase != null),
        _getCategoryListUseCase = getCategoryListUseCase,
        _saveCategoryListUseCase = saveCategoryListUseCase,
        _deleteCategoryUseCase = deleteCategoryUseCase,
        _updateCategoryUseCase = updateCategoryUseCase,
        super(CategoryInitial());

  final GetCategoryListUseCase _getCategoryListUseCase;
  final SaveCategoryListUseCase _saveCategoryListUseCase;
  final DeleteCategoryUseCase _deleteCategoryUseCase;
  final UpdateCategoryUseCase _updateCategoryUseCase;

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is GetCategoryListEvent) {
      yield CategoryLoading();
      final failureOrCategory = await _getCategoryListUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrCategory);
    }
    if (event is SaveCategoryEvent) {
      yield CategorySaving();
      CategorySaveReqEntity categorySaveReqModel =
          CategorySaveReqEntity(name: event.data.name);
      final failureOrCategory =
          await _saveCategoryListUseCase(categorySaveReqModel);
      yield* _eitherSaveOrErrorState(failureOrCategory);
      // yield failureOrCategory.fold(
      //   (l) => CategoryFailureState('error'),
      //   (r) => CategorySaveSuccess(r),
      // );
    }
    if (event is DeleteCategoryEvent) {
      yield CategoryDeleting();
      CategoryDeleteReqEntity categoryDeleteReqModel =
          CategoryDeleteReqEntity(id: event.data.id);
      final failureOrCategory =
          await _deleteCategoryUseCase(categoryDeleteReqModel);
      yield* _eitherDeleteOrErrorState(failureOrCategory);
    }
    if (event is UpdateCategoryEvent) {
      yield CategoryUpdating();
      CategorySaveReqEntity categorySaveReqEntity =
          CategorySaveReqEntity(name: event.data.name, id: event.data.id);
      final failureOrCategory =
          await _updateCategoryUseCase(categorySaveReqEntity);
      yield* _eitherSaveOrErrorState(failureOrCategory);
    }
  }

  Stream<CategoryState> _eitherLoadedOrErrorState(
      Either<Failure, List<CategoryEntity>> failureOrCategory) async* {
    yield failureOrCategory.fold(
      (l) => CategoryFailureState('error'),
      (r) => CategoryLoaded(r),
    );
  }

  Stream<CategoryState> _eitherSaveOrErrorState(
      Either<Failure, CategorySaveResEntity> failureOrCategory) async* {
    yield failureOrCategory.fold(
      (l) => CategoryFailureState('error'),
      (r) {
        return CategorySaveSuccess(r);
      },
    );
  }

  Stream<CategoryState> _eitherDeleteOrErrorState(
      Either<Failure, CategoryDeleteResEntity> failureOrCategory) async* {
    yield failureOrCategory.fold(
      (l) => CategoryFailureState('error'),
      (r) => CategoryDeleteSuccess(r),
    );
  }
}
