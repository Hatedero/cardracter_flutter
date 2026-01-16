import 'package:cardracter_flutter/app/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable(explicitToJson: true)
class Card {
  final int id;
  final String title;
  final int image;
  final CardType type;
  final List<Category> categories;

  Card(
      {required this.id, required this.title, required this.image, required this.type, required this.categories});
}

enum CardType { Character, Collection }