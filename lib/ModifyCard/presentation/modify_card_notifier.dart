import 'package:cardracter_flutter/app/model/attribute_data.dart';
import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/app/model/category.dart';
import 'package:cardracter_flutter/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ModifyCardNotifier extends ChangeNotifier {
  late Card card;
  int lastCategoryId = -1;
  int lastAttributeId = -1;

  void getCard() {
    print("CREATE CARD");
    card = Card(0, "New Card", "", CardType.Character, List.empty());

    this.card = card;

    notifyListeners();
  }

  void saveCard() {
    print(card.toJson());
    cardRepository.saveCard(card);
  }

  void addNewCategory() {
    var newCategories = card.categories.toList();
    newCategories.add(
      Category(lastCategoryId + 1, "New Category", card.id, List.empty()),
    );

    this.card = card.copyWith(categories: newCategories);
    lastCategoryId += 1;
    notifyListeners();
  }

  void addNewAttribute(int categoryId) {
    Category? category;

    card.categories.forEach((element) {
      if (element.categoryId == categoryId) {
        category = element;
      }
    });

    var newAttributes = category?.attributes.toList();

    if (category != null && newAttributes != null) {
      newAttributes.add(
        Attribute(lastAttributeId + 1, "title", "New attribute", categoryId),
      );
      lastAttributeId += 1;

      category = category!.copyWith(attributes: newAttributes);

      List<Category> newCategories = card.categories.toList();

      int index = 0;
      newCategories.forEach((categoryToReplace) {
        if (categoryToReplace.categoryId == category!.categoryId) {
          newCategories[index] = category!;
        }
        index += 1;
      });

      this.card = card.copyWith(categories: newCategories);
      notifyListeners();
    } else
      print("Error when fetching category");
  }

  void deleteCategory(int categoryId) {
    print("DELETE CATEGORY " + categoryId.toString());
    var newCategories = card.categories.toList();
    newCategories.removeWhere((category) => category.categoryId == categoryId);

    this.card = card.copyWith(categories: newCategories);
    notifyListeners();
  }

  void deleteAttribute(int attributeId) {
    print("DELETE ATTRIBUTE " + attributeId.toString());

    Category? categoryToModify;
    Attribute? attributeToDelete;

    card.categories.forEach((category) {
      category.attributes.forEach((attribute) {
        if (attribute.attributeId == attributeId) {
          categoryToModify = category;
          attributeToDelete = attribute;
        }
      });
    });

    var newAttributes = categoryToModify?.attributes.toList();

    if (categoryToModify != null && newAttributes != null) {
      newAttributes.remove(attributeToDelete);

      categoryToModify = categoryToModify!.copyWith(attributes: newAttributes);

      List<Category> newCategories = card.categories.toList();

      int index = 0;
      newCategories.forEach((categoryToReplace) {
        if (categoryToReplace.categoryId == categoryToModify!.categoryId) {
          newCategories[index] = categoryToModify!;
        }
        index += 1;
      });

      this.card = card.copyWith(categories: newCategories);
      notifyListeners();
    }
  }

  void modifyCardTitle({required String newTitle}) {
    this.card = card.copyWith(title: newTitle);
  }

  void modifyCategoryTitle({
    required String newTitle,
    required int categoryId,
  }) {
    var newCategories = card.categories.toList();
    int index = 0;
    newCategories.forEach((category) {
      if (category.categoryId == categoryId) {
        newCategories[index] = category.copyWith(title: newTitle);
      }
      index += 1;
    });

    this.card = card.copyWith(categories: newCategories);
    print(this.card.categories);
    notifyListeners();
  }

  void modifyAttributeValue({
    required String newValue,
    required int attributeId,
    required int categoryId,
  }) {
    Category? category;

    card.categories.forEach((element) {
      if (element.categoryId == categoryId) {
        category = element;
      }
    });

    var newAttributes = category?.attributes.toList();

    if (category != null && newAttributes != null) {
      int index = 0;

      newAttributes.forEach((attribute) {
        if (attribute.attributeId == attributeId) {
          newAttributes[index] = attribute.copyWith(value: newValue);
        }
        index += 1;
      });

      category = category!.copyWith(attributes: newAttributes);

      List<Category> newCategories = card.categories.toList();

      index = 0;
      newCategories.forEach((categoryToReplace) {
        if (categoryToReplace.categoryId == category!.categoryId) {
          newCategories[index] = category!;
        }
        index += 1;
      });

      this.card = card.copyWith(categories: newCategories);
      notifyListeners();
    } else
      print("Error when fetching category");
  }
}
