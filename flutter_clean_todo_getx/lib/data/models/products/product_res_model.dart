import '../../../domain/entities/products/product_list_res_entity.dart';

class ProductResModel {
  ProductResModel({
    this.data,
    this.statusCode,
    this.statusMessage,
    this.links,
    this.meta,
  });

  final List<ProductResModelData> data;
  final int statusCode;
  final String statusMessage;
  final Links links;
  final Meta meta;

  factory ProductResModel.fromJson(Map<String, dynamic> json) =>
      ProductResModel(
        data: List<ProductResModelData>.from(
            json["data"].map((x) => ProductResModelData.fromJson(x))),
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "statusCode": statusCode,
        "statusMessage": statusMessage,
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class ProductResModelData extends ProductResEntity {
  ProductResModelData({
    this.id,
    this.productName,
    this.productPrice,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String productName;
  final int productPrice;
  final String createdAt;
  final String updatedAt;

  factory ProductResModelData.fromJson(Map<String, dynamic> json) =>
      ProductResModelData(
        id: json["id"],
        productName: json["productName"],
        productPrice: json["productPrice"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productPrice": productPrice,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  final String first;
  final String last;
  final String prev;
  final String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  final int currentPage;
  final int from;
  final int lastPage;
  final String path;
  final int perPage;
  final int to;
  final int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
