// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      producer: json['producer'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      type: json['type'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      size: (json['size'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      downloadCount: json['downloadCount'] as int?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'rate': instance.rate,
      'type': instance.type,
      'category': instance.category,
      'size': instance.size,
      'images': instance.images,
      'downloadCount': instance.downloadCount,
      'description': instance.description,
      'price': instance.price,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
