import 'package:equatable/equatable.dart';

class CategorySaveResEntity extends Equatable {
  final String statusMessage;

  CategorySaveResEntity({this.statusMessage});

  @override
  List<Object> get props => [statusMessage];
}
