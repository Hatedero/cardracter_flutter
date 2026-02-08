import 'package:cardracter_flutter/app/model/card.dart';
import 'package:flutter/cupertino.dart';
import '../../repository/card_repository.dart';

class CardDetailsNotifier extends ChangeNotifier {

  Card? card;

  void getCard() async {
    final card = await cardRepository.getCard(1);

    if (card != null)
      this.card = card;
    else
      this.card = Card(0, 1, "Artorias", "", "The Abyss Walker", CardType.Character, List.empty());
    notifyListeners();
  }
}