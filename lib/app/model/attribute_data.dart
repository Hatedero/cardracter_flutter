import 'package:json_annotation/json_annotation.dart';

part 'attribute_data.g.dart';

@JsonSerializable(explicitToJson: true)
class Attribute {
  final int? attributeId;
  final String? title;
  final String? value;
  final int? categoryId;

  Attribute(this.attributeId, this.title, this.value, this.categoryId);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}
