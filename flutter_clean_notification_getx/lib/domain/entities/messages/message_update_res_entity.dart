import 'package:equatable/equatable.dart';

class MessageUpdateResEntity extends Equatable {
  final int statusCode;
  final String statusMessage;

  MessageUpdateResEntity({this.statusCode, this.statusMessage});

  @override
  List<Object> get props => [statusCode, statusMessage];
}
