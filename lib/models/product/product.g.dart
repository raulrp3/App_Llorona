// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return _$_Product(
    id: json['id'] as String,
    name: json['name'] as String,
    price: json['price'] as String,
    content: json['content'] as String,
    excerpt: json['excerpt'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'content': instance.content,
      'excerpt': instance.excerpt,
      'image': instance.image,
    };
