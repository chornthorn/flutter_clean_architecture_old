import 'package:dartz/dartz.dart';
import 'package:excise_notification/data/datasource/local/messages/message_local_datasource.dart';
import 'package:flutter/foundation.dart';

import '../../core/core.dart';
import '../../core/errors/failure.dart';
import '../../domain/entities/messages/message_read_req_entity.dart';
import '../../domain/entities/messages/message_read_res_entity.dart';
import '../../domain/entities/messages/message_req_entity.dart';
import '../../domain/entities/messages/message_res_entity.dart';
import '../../domain/entities/messages/message_update_res_entity.dart';
import '../../domain/repositories/message_repository.dart';
import '../datasource/remote/messages/message_remote_datasource.dart';
import '../models/messages/message_delete_req_model.dart';
import '../models/messages/message_delete_res_model.dart';
import '../models/messages/message_update_req_model.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource _remoteDataSource;
  MessageLocalDataSource _localDataSource;

  MessageRepositoryImpl({
    @required MessageRemoteDataSource messageRemoteDataSource,
  })  : assert(messageRemoteDataSource != null),
        _remoteDataSource = messageRemoteDataSource;

  @override
  Future<Either<Failure, MessageResEntity>> getMessage(
      {MessageReqDataEntity reqDataEntity}) async {
    try {
      final _r = await _remoteDataSource.getMessage(reqModel: reqDataEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageReadResEntity>> readMessage(
      {MessageReadReqEntity reqDataEntity}) async {
    try {
      final _r = await _remoteDataSource.readMessage(reqDataEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageDeleteResModel>> deleteMessage(
      {MessageDeleteReqModelData reqDataEntity}) async {
    try {
      final _r = await _remoteDataSource.deleteMessage(reqDataEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageUpdateResEntity>> updateMessage(
      {MessageUpdateReqModelData reqDataEntity}) async {
    try {
      final _r = await _remoteDataSource.updateMessage(reqDataEntity);
      return Right(_r);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
