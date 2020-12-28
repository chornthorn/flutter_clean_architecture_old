import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/networks/http.dart';
import '../../../../core/utils/path.dart';
import '../../../../domain/entities/messages/message_delete_res_entity.dart';
import '../../../../domain/entities/messages/message_read_res_entity.dart';
import '../../../../domain/entities/messages/message_req_entity.dart';
import '../../../../domain/entities/messages/message_res_entity.dart';
import '../../../../domain/entities/messages/message_update_res_entity.dart';
import '../../../models/messages/message_delete_req_model.dart';
import '../../../models/messages/message_delete_res_model.dart';
import '../../../models/messages/message_read_req_model.dart';
import '../../../models/messages/message_read_res_model.dart';
import '../../../models/messages/message_req_model.dart';
import '../../../models/messages/message_res_model.dart';
import '../../../models/messages/message_update_req_model.dart';
import '../../../models/messages/message_update_res_model.dart';

abstract class MessageRemoteDataSource {
  Future<MessageResEntity> getMessage({MessageReqDataEntity reqModel});
  Future<MessageReadResEntity> readMessage(MessageReadReqModelData reqModel);
  Future<MessageDeleteResEntity> deleteMessage(
      MessageDeleteReqModelData reqModel);
  Future<MessageUpdateResEntity> updateMessage(
      MessageUpdateReqModelData reqModel);
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final CustomHttp _customHttp;

  MessageRemoteDataSourceImpl({@required CustomHttp customHttp})
      : assert(customHttp != null, 'custom http should not be null'),
        _customHttp = customHttp;

  @override
  Future<MessageResEntity> getMessage({MessageReqDataEntity reqModel}) async {
    var path = "$BASE_URL/api/message/list";

    MessageReqModelData messageReqModelData = MessageReqModelData();
    messageReqModelData.userName = reqModel.userName;
    messageReqModelData.moduleName = reqModel.moduleName;
    messageReqModelData.messageStatus = reqModel.messageStatus;
    messageReqModelData.keySearch = reqModel.keySearch;

    MessageReqModelPaging paging = MessageReqModelPaging();
    paging.pageNo = reqModel.pageNo;
    paging.pageSize = reqModel.pageSize;

    MessageReqModel messageReqModel = MessageReqModel();
    messageReqModel.entrypFlag = "N";
    messageReqModel.paging = paging;
    messageReqModel.data = messageReqModelData;

    var body = json.encode(messageReqModel);
    var response = await _customHttp.postRequest(path: path, body: body);
    var res = MessageResModel.fromJson(response);
    return res;
  }

  @override
  Future<MessageReadResEntity> readMessage(
      MessageReadReqModelData reqModel) async {
    var path = "$BASE_URL/api/message/get";
    MessageReadReqModel messageReadReqModel = MessageReadReqModel();
    messageReadReqModel.entrypFlag = "N";
    messageReadReqModel.data = reqModel;
    var body = json.encode(messageReadReqModel);
    var response = await _customHttp.postRequest(path: path, body: body);
    var res = MessageReadResModel.fromJson(response);
    print(res.data);
    return res.data;
  }

  @override
  Future<MessageDeleteResEntity> deleteMessage(
      MessageDeleteReqModelData reqModel) async {
    var path = "$BASE_URL/api/message/delete";
    MessageDeleteReqModel messageReadReqModel = MessageDeleteReqModel();
    messageReadReqModel.entrypFlag = "N";
    messageReadReqModel.data = reqModel;
    var body = json.encode(messageReadReqModel);
    var response = await _customHttp.postRequest(path: path, body: body);
    var res = MessageDeleteResModel.fromJson(response);
    return res;
  }

  @override
  Future<MessageUpdateResEntity> updateMessage(
      MessageUpdateReqModelData reqModel) async {
    var path = "$BASE_URL/api/message/update-status";
    MessageUpdateReqModel messageUpdateReqModel = MessageUpdateReqModel();
    messageUpdateReqModel.entrypFlag = "N";
    messageUpdateReqModel.data = reqModel;
    var body = json.encode(messageUpdateReqModel);
    var response = await _customHttp.postRequest(path: path, body: body);
    var res = MessageUpdateResModel.fromJson(response);
    return res;
  }
}
