import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/home/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class NewCardNotifier extends ChangeNotifier {

  Card? card;

  void getCard() async {
    //final card = await cardRepository.getCards();
    final card = Card(0, "Artorias The Abyss Walker", "", CardType.Character, List.empty());

    /*if (cards.cards != null && cards.cards!.isNotEmpty)
      this.card = cards.cards.first;
    else
      this.card = Card(0, "Artorias The Abyss Walker", "", CardType.Character, List.empty());*/

    this.card = card;

    notifyListeners();
  }
}