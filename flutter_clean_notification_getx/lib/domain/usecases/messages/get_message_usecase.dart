import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../entities/messages/message_req_entity.dart';
import '../../entities/messages/message_res_entity.dart';
import '../../repositories/message_repository.dart';

class GetMessageUseCase
    implements UseCase<MessageResEntity, MessageReqDataEntity> {
  final MessageRepository _repository;

  GetMessageUseCase({@required MessageRepository messageRepository})
      : assert(messageRepository != null),
        _repository = messageRepository;

  @override
  Future<Either<Failure, MessageResEntity>> call(
      MessageReqDataEntity params) async {
    return await _repository.getMessage(reqDataEntity: params);
  }
}
