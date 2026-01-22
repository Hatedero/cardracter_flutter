import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/app/model/category.dart';
import 'package:cardracter_flutter/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class NewCardNotifier extends ChangeNotifier {

  late Card card;
  int lastCategoryId = -1;
  int lastAttributeId = -1;

  void createCard() {
    final card = Card(0, "New Card", "", CardType.Character, List.empty());

    this.card = card;


    notifyListeners();
  }

  void addNewCategory() {
    var newCategories = card.categories.toList();
    newCategories.add(Category(lastCategoryId + 1, "New Category", card.id, List.empty()));

    this.card = card.copyWith(categories: newCategories);
    lastCategoryId += 1;
  }

  void modifyCardTitle({required String newTitle}) {
    this.card = card.copyWith(title: newTitle);
  }
}