import '../../../data/models/messages/message_read_req_model.dart';

class MessageReadReqEntity extends MessageReadReqModelData {
  String messageId;
  String userName;
  String moduleName;

  MessageReadReqEntity({this.messageId, this.userName, this.moduleName});
}
