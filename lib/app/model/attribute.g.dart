// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) => Attribute(
      (json['attributeId'] as num).toInt(),
      json['title'] as String,
      json['value'] as String,
      (json['categoryId'] as num).toInt(),
    );

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'attributeId': instance.attributeId,
      'title': instance.title,
      'value': instance.value,
      'categoryId': instance.categoryId,
    };
