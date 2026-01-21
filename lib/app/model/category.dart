import 'package:json_annotation/json_annotation.dart';

import 'attribute_data.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)

class Category {
  final int categoryId;
  final String title;
  final int cardId;
  final List<Attribute> attributes;

  Category(this.categoryId,  this.title,  this.cardId,  this.attributes);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}