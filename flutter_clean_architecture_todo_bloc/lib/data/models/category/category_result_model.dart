import 'category_model.dart';

class CategoryResultModel {
  CategoryResultModel({
    this.data,
  });

  final List<CategoryModel> data;

  factory CategoryResultModel.fromJson(Map<String, dynamic> json) =>
      CategoryResultModel(
        data: json["data"] == null
            ? null
            : List<CategoryModel>.from(json["data"].map(
                (x) => CategoryModel.fromJson(x),
              )),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson()))
      };
}

// CategoryResultModel.fromJson(Map<String, dynamic> json) {
// if (json["data"] != null) {
// data = new List<CategoryModel>();
// json["data"].forEach((v) {
// data.add(new CategoryModel.fromJson(v));
// });
// }
// }
