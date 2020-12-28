import 'package:equatable/equatable.dart';

class ProductDeleteResEntity extends Equatable {
  ProductDeleteResEntity({
    this.statusMessage,
  });

  final String statusMessage;

  @override
  List<Object> get props => [statusMessage];
}
