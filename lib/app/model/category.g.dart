// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  categoryId: (json['categoryId'] as num).toInt(),
  title: json['title'] as String,
  cardId: (json['cardId'] as num).toInt(),
  attributes: (json['attributes'] as List<dynamic>)
      .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'title': instance.title,
  'cardId': instance.cardId,
  'attributes': instance.attributes.map((e) => e.toJson()).toList(),
};
