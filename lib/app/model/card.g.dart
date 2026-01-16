// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: (json['image'] as num).toInt(),
  type: $enumDecode(_$CardTypeEnumMap, json['type']),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
  'type': _$CardTypeEnumMap[instance.type]!,
  'categories': instance.categories.map((e) => e.toJson()).toList(),
};

const _$CardTypeEnumMap = {
  CardType.Character: 'Character',
  CardType.Collection: 'Collection',
};
