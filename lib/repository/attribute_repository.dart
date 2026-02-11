import 'package:cardracter_flutter/app/api/api.dart';

final attributeRepository = _AttributeRepository();

class _AttributeRepository {
  Future<void> saveAttribute(String label, String value, int categoryId) async {
    apiCard.saveAttribute(label,value,categoryId);
  }
}