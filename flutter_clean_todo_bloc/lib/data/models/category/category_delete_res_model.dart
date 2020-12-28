import '../../../domain/domain.dart';

class CategoryDeleteResModel extends CategoryDeleteResEntity {
  CategoryDeleteResModel({
    this.statusMessage,
  });

  final String statusMessage;

  factory CategoryDeleteResModel.fromJson(Map<String, dynamic> json) =>
      CategoryDeleteResModel(
        statusMessage: json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "status_message": statusMessage,
      };
}
