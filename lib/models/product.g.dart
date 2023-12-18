// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['idProduct'] as String,
      json['name'] as String,
      json['image'] as String,
      (json['cost'] as num).toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['desc'] as String?,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'idProduct': instance.idProduct,
      'name': instance.name,
      'image': instance.image,
      'cost': instance.cost,
      'discount': instance.discount,
      'desc': instance.desc,
      'categories': instance.categories,
    };
