import '../../../domain/entities/messages/message_delete_res_entity.dart';

// ignore: must_be_immutable
class MessageDeleteResModel extends MessageDeleteResEntity {
  int statusCode;
  String statusMessage;

  MessageDeleteResModel({this.statusCode, this.statusMessage});

  MessageDeleteResModel.fromJson(Map<String, dynamic> json) {
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
