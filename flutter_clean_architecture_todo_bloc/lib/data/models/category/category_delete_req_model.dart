class CategoryDeleteReqModel {
  CategoryDeleteReqModel({
    this.id,
  });

  final int id;

  factory CategoryDeleteReqModel.fromJson(Map<String, dynamic> json) =>
      CategoryDeleteReqModel(
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
      };
}
