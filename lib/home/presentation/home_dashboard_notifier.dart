import 'package:cardracter_flutter/app/model/card.dart';
import 'package:cardracter_flutter/home/repository/card_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeDashboardNotifier extends ChangeNotifier {

  List<Card>? cards;

  void getCards() async {
    final cards = await cardRepository.getCards();
    this.cards = cards.cards;
    notifyListeners();
  }
}