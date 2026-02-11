import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeDashboardNotifier extends ChangeNotifier {

  List<Card>? cards;

  void getCards() async {
    final heighestId = await cardRepository.getCardHeightsId();

    final List<Card> cardOneByOne = List.empty(growable: true);
    for(int i=1; i<heighestId;i++){
      try {
        final card = await cardRepository.getCard(i);
        if(card.type == CardType.Character) {
          cardOneByOne.add(card);
        }
      } catch (e) {
        print("Error fetching card ID $i: $e");
      }
    }
    if(cardOneByOne.isNotEmpty){
      this.cards = cardOneByOne;
    } else {
      this.cards = List.filled(10, Card(
          0,
          1,
          "Artorias",
          "",
          " The Abyss Walker",
          CardType.Character,
          List.empty()));
    }
      notifyListeners();
  }
}