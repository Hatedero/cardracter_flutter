import 'package:cardracter_flutter/app/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable(explicitToJson: true)
class Card {
  final int id;
  final String title;
  final String image;
  final CardType type;
  final List<Category> categories;

  Card(this.id,  this.title,  this.image,  this.type,  this.categories);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}

enum CardType { Character, Collection }

@JsonSerializable(explicitToJson: true)
class Cards {
  @JsonKey(name: "cards")
  final List<Card>? cards;

  Cards({this.cards});

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);
  Map<String, dynamic> toJson() => _$CardsToJson(this);
}