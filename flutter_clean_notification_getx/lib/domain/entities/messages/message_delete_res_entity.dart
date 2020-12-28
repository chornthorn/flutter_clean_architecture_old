import 'package:equatable/equatable.dart';

class MessageDeleteResEntity extends Equatable {
  final int statusCode;
  final String statusMessage;

  MessageDeleteResEntity({this.statusCode, this.statusMessage});

  @override
  List<Object> get props => [statusCode, statusMessage];
}
