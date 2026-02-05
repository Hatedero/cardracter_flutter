import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/home/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class CardDetailsNotifier extends ChangeNotifier {

  Card? card;

  void getCard() async {
    final card = await cardRepository.getCard(4);

    if (card != null)
      this.card = card;
    else
      this.card = Card(0, "Artorias The Abyss Walker", "", CardType.Character, List.empty());
    notifyListeners();
  }
}