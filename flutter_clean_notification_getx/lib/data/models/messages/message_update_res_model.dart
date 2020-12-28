import '../../../domain/entities/messages/message_update_res_entity.dart';

// ignore: must_be_immutable
class MessageUpdateResModel extends MessageUpdateResEntity {
  int statusCode;
  String statusMessage;

  MessageUpdateResModel({this.statusCode, this.statusMessage});

  MessageUpdateResModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}
