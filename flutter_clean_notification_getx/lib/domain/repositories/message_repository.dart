import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../data/models/messages/message_delete_req_model.dart';
import '../../data/models/messages/message_update_req_model.dart';
import '../entities/messages/message_delete_res_entity.dart';
import '../entities/messages/message_read_req_entity.dart';
import '../entities/messages/message_read_res_entity.dart';
import '../entities/messages/message_req_entity.dart';
import '../entities/messages/message_res_entity.dart';
import '../entities/messages/message_update_res_entity.dart';

abstract class MessageRepository {
  Future<Either<Failure, MessageResEntity>> getMessage(
      {MessageReqDataEntity reqDataEntity});
  Future<Either<Failure, MessageReadResEntity>> readMessage(
      {MessageReadReqEntity reqDataEntity});
  Future<Either<Failure, MessageDeleteResEntity>> deleteMessage(
      {MessageDeleteReqModelData reqDataEntity});
  Future<Either<Failure, MessageUpdateResEntity>> updateMessage(
      {MessageUpdateReqModelData reqDataEntity});
}
