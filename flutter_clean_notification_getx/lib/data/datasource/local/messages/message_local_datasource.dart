import 'package:excise_notification/domain/entities/messages/message_req_entity.dart';
import 'package:excise_notification/domain/entities/messages/message_res_entity.dart';

abstract class MessageLocalDataSource {
  Future<MessageResEntity> getMessage({MessageReqDataEntity reqModel});
}
