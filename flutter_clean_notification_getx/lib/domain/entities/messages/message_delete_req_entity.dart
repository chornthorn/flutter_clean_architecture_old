import '../../../data/models/messages/message_delete_req_model.dart';

class MessageDeleteReqEntity extends MessageDeleteReqModelData {
  String messageId;
  String userName;
  String moduleName;

  MessageDeleteReqEntity({this.messageId, this.userName, this.moduleName});
}
