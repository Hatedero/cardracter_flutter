// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['image'] as num).toInt(),
      $enumDecode(_$CardTypeEnumMap, json['type']),
      (json['categories'] as List<dynamic>)
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

Cards _$CardsFromJson(Map<String, dynamic> json) => Cards(
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardsToJson(Cards instance) => <String, dynamic>{
      'cards': instance.cards?.map((e) => e.toJson()).toList(),
    };
