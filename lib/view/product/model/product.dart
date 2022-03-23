import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part "product.g.dart";

@JsonSerializable()
class Product extends BaseModel<Product> {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? producer;
  double? rate;
  String? type;
  List<Category>? category;
  double? size;
  List<String>? images;
  int? downloadCount;
  String? description;
  double? price;

  Product(
      {this.id,
      this.name,
      this.producer,
      this.rate,
      this.type,
      this.category,
      this.size,
      this.images,
      this.downloadCount,
      this.description,
      this.price});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  Product fromJson(Map<String, Object?> json) {
    return fromJson(json);
  }
}

@JsonSerializable()
class Category extends BaseModel<Category> {
  @JsonKey(name: '_id')
  String? id;
  String? name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  Category fromJson(Map<String, Object?> json) {
    return fromJson(json);
  }
}


// @JsonSerializable()
// class Product extends BaseModel<Product> {
//   @JsonKey(name: '_id')
//   String? id;
//   String? name;
//   String? producer;
//   double? rate;
//   String? type;
//   List<String>? category;
//   double? size;
//   List<String>? images;
//   double? downloadCount;
//   String? description;
//   double? price;

//   Product(
//       {this.id,
//       this.name,
//       this.producer,
//       this.rate,
//       this.type,
//       this.category,
//       this.size,
//       this.images,
//       this.downloadCount,
//       this.description,
//       this.price});

//   factory Product.fromJson(Map<String, dynamic> json) =>
//       _$ProductFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$ProductToJson(this);

//   @override
//   fromJson(Map<String, Object?> json) {
//     return fromJson(json);
//   }
// }
