import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({this.message});
  @override
  List<Object> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}
