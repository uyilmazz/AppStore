import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/model/base_model.dart';

part "type.g.dart";

@JsonSerializable()
class ProductType extends BaseModel<ProductType> {
  @JsonKey(name: '_id')
  String? id;
  String? name;

  ProductType({this.id, this.name});

  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);

  @override
  ProductType fromJson(Map<String, Object?> json) {
    return fromJson(json);
  }
}
