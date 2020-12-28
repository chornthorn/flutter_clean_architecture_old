import 'package:equatable/equatable.dart';

class ProductSaveResEntity extends Equatable {
  ProductSaveResEntity({
    this.statusMessage,
  });

  final String statusMessage;

  @override
  List<Object> get props => [statusMessage];
}
