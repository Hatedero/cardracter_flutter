import 'package:cardracter_flutter/app/model/card.dart';
import 'package:flutter/cupertino.dart';

import '../../Repository/card_repository.dart';

class CardDetailsNotifier extends ChangeNotifier {
  Card? card;

  void getCard(int id) async {
    final card = await cardRepository.getCard(id);

    if (card!= null)
      this.card = card;
    else
      this.card = Card(0, "Artorias The Abyss Walker", "", CardType.Character, List.empty());
    notifyListeners();
  }
}