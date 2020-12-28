import '../../../data/models/messages/message_update_req_model.dart';

class MessageUpdateReqEntity extends MessageUpdateReqModelData {
  String messageId;
  String userName;
  String moduleName;
  String messageStatus;

  MessageUpdateReqEntity({
    this.messageId,
    this.userName,
    this.moduleName,
    this.messageStatus,
  });
}
