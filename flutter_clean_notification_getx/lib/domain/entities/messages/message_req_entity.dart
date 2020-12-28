import 'package:equatable/equatable.dart';

class MessageReqDataEntity extends Equatable {
  String keySearch;
  String userName;
  String moduleName;
  String messageStatus;
  int pageNo;
  int pageSize;

  MessageReqDataEntity(
      {this.keySearch,
      this.userName,
      this.moduleName,
      this.messageStatus,
      this.pageNo,
      this.pageSize});

  @override
  List<Object> get props => [
        keySearch,
        userName,
        moduleName,
        messageStatus,
        pageNo,
        pageSize,
      ];
}
