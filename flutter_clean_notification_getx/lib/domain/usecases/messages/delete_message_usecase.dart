import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../entities/messages/message_delete_req_entity.dart';
import '../../entities/messages/message_delete_res_entity.dart';
import '../../repositories/message_repository.dart';

class DeleteMessageUseCase
    implements UseCase<MessageDeleteResEntity, MessageDeleteReqEntity> {
  final MessageRepository _repository;

  DeleteMessageUseCase({@required MessageRepository messageRepository})
      : assert(messageRepository != null),
        _repository = messageRepository;

  @override
  Future<Either<Failure, MessageDeleteResEntity>> call(
      MessageDeleteReqEntity params) async {
    return await _repository.deleteMessage(reqDataEntity: params);
  }
}
