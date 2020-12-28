import 'package:equatable/equatable.dart';

class CategoryDeleteResEntity extends Equatable {
  final String statusMessage;

  CategoryDeleteResEntity({this.statusMessage});

  @override
  List<Object> get props => [statusMessage];
}
