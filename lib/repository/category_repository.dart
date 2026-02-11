import 'package:cardracter_flutter/app/api/api.dart';

final categoryRepository = _CategoryRepository();

class _CategoryRepository {
  Future<int> saveCategory(String title, int cardId) async {
    return apiCard.saveCategory(title,cardId);
  }
}