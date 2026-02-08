import 'package:cardracter_flutter/app/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable(explicitToJson: true)
class Card {
  final int cardId;
  final int accountId;
  final String title;
  final String image;
  final String description;
  final CardType type;
  final List<Category> categories;
  Card(this.cardId, this.accountId, this.title, this.image, this.description, this.type, this.categories);

  Card copyWith({
    int? cardId,
    int? accountId,
    String? title,
    String? image,
    String? description,
    CardType? type,
    List<Category>? categories
  }) {
    return Card(
      cardId = cardId ?? this.cardId,
      accountId = accountId ?? this.accountId,
      title = title ?? this.title,
      image = image ?? this.image,
      description = description ?? this.description,
      type = type ?? this.type,
      categories = categories ?? this.categories,
    );
  }

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
