part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoryListEvent extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class SaveCategoryEvent extends CategoryEvent {
  final CategorySaveReqEntity data;

  SaveCategoryEvent({this.data});
  @override
  List<Object> get props => [data];
}

class DeleteCategoryEvent extends CategoryEvent {
  final CategoryDeleteReqEntity data;

  DeleteCategoryEvent({this.data});
  @override
  List<Object> get props => [data];
}

class UpdateCategoryEvent extends CategoryEvent {
  final CategorySaveReqEntity data;

  UpdateCategoryEvent({this.data});
  @override
  List<Object> get props => [data];
}
