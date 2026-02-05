import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/home/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeDashboardNotifier extends ChangeNotifier {

  List<Card>? cards;

  void getCards() async {
    final cards = await cardRepository.getCards();
    final card = await cardRepository.getCard(2);

    if (cards.cards != null && cards.cards!.isNotEmpty)
      this.cards = cards.cards;
    else if (card != null && card.cardId!=0)
      this.cards = List.filled(10,card);
    else
      this.cards = List.filled(10, Card(0, "Artorias The Abyss Walker", "", CardType.Character, List.empty()));
    print(this.cards?.first.image);
    notifyListeners();
  }
}