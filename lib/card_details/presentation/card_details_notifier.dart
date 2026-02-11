import 'package:cardracter_flutter/app/model/card.dart';
import 'package:flutter/cupertino.dart';
import '../../repository/card_repository.dart';

class CardDetailsNotifier extends ChangeNotifier {

  Card card = Card(0,1,"Artorias","","The Abyss Walker",CardType.Character,List.empty());
  bool isLoading = false;

  void getCard(int cardId) async {
    isLoading = true;
    final card = await cardRepository.getCard(cardId);

    try {
      if(cardId != 0) {
        this.card = card;
      }
    }catch (e) {
      this.card = Card(
          0,
          1,
          "Artorias",
          "",
          "The Abyss Walker",
          CardType.Character,
          List.empty());
    }
    notifyListeners();
    isLoading = false;
    //print("card updated"+ this.card.toJson().toString());
  }
}