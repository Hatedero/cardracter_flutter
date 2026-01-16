import 'package:cardracter_flutter/app/model/attribute.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)

class Category {
  final int categoryId;
  final String title;
  final int cardId;
  final List<Attribute> attributes;

  Category({required this.categoryId, required this.title, required this.cardId, required this.attributes});
}