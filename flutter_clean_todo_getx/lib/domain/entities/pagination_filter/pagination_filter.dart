import 'package:equatable/equatable.dart';

class PaginationFilter extends Equatable {
  int page;
  int limit;

  @override
  List<Object> get props => [page, limit];
}
