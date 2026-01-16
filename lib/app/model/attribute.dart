import 'package:json_annotation/json_annotation.dart';

part 'attribute.g.dart';

@JsonSerializable(explicitToJson: true)

class Attribute {
  final int attributeId;
  final String title;
  final String value;
  final int categoryId;

  Attribute({required this.attributeId, required this.title, required this.value, required this.categoryId});
}