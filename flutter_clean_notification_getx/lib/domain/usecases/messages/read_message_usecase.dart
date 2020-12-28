import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../entities/messages/message_read_req_entity.dart';
import '../../entities/messages/message_read_res_entity.dart';
import '../../repositories/message_repository.dart';

class ReadMessageUseCase
    implements UseCase<MessageReadResEntity, MessageReadReqEntity> {
  final MessageRepository _repository;

  ReadMessageUseCase({@required MessageRepository messageRepository})
      : assert(messageRepository != null),
        _repository = messageRepository;
  @override
  Future<Either<Failure, MessageReadResEntity>> call(
      MessageReadReqEntity params) async {
    return await _repository.readMessage(reqDataEntity: params);
  }
}
