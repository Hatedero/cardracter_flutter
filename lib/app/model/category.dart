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

  Category copyWith({
    int? categoryId,
    String? title,
    int? cardId,
    List<Attribute>? attributes
  }) {
    return Category(
      categoryId = categoryId ?? this.categoryId,
      title = title ?? this.title,
      cardId = cardId ?? this.cardId,
      attributes = attributes ?? this.attributes,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}