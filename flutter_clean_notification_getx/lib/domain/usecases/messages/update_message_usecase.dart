import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../entities/messages/message_update_req_entity.dart';
import '../../entities/messages/message_update_res_entity.dart';
import '../../repositories/message_repository.dart';

class UpdateMessageUseCase
    implements UseCase<MessageUpdateResEntity, MessageUpdateReqEntity> {
  final MessageRepository _repository;

  UpdateMessageUseCase({@required MessageRepository messageRepository})
      : assert(messageRepository != null),
        _repository = messageRepository;

  @override
  Future<Either<Failure, MessageUpdateResEntity>> call(
      MessageUpdateReqEntity params) async {
    return await _repository.updateMessage(reqDataEntity: params);
  }
}
