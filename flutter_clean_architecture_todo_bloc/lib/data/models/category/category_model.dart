import '../../../domain/domain.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
