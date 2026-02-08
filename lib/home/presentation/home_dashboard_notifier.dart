import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeDashboardNotifier extends ChangeNotifier {

  List<Card>? cards;

  void getCards() async {
    final cards = await cardRepository.getCards();
    final heighestId = await cardRepository.getCardHeightsId();

    final List<Card> cardOneByOne = List.empty(growable: true);
    for(int i=1; i<heighestId;i++){
      try {
        final card = await cardRepository.getCard(i);
        cardOneByOne.add(card);
      } catch (e) {
        print("Error fetching card ID $i: $e");
      }
    }
    if (cards.cards != null && cards.cards!.isNotEmpty) {
      print("ya");
      this.cards = cards.cards;
    }
    else if(cardOneByOne != null){
      print("yo");
      this.cards = cardOneByOne;
    }
    else
      this.cards = List.filled(10, Card(0, "Artorias", ""," The Abyss Walker", CardType.Character, List.empty()));
    notifyListeners();
  }
}