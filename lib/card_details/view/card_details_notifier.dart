import 'package:cardracter_flutter/app/model/attribute_data.dart';
import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/app/model/category.dart';
import 'package:cardracter_flutter/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class CardDetailsNotifier extends ChangeNotifier {
  Card? card;

  void getCard(int id) async {
    final card = await cardRepository.getCard(id);

    if (card!= null)
      this.card = card;

    notifyListeners();
  }
}
