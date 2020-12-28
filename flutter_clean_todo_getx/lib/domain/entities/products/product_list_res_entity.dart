import 'package:equatable/equatable.dart';

class ProductResEntity extends Equatable {
  final int id;
  final String productName;
  final int productPrice;
  final String createdAt;
  final String updatedAt;

  ProductResEntity(
      {this.id,
      this.productName,
      this.productPrice,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object> get props => [
        id,
        productName,
        productPrice,
        createdAt,
        updatedAt,
      ];
}
