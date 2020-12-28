class CategorySaveReqModel {
  CategorySaveReqModel({
    this.name,
  });

  final String name;
  int id;

  factory CategorySaveReqModel.fromJson(Map<String, dynamic> json) =>
      CategorySaveReqModel(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}
