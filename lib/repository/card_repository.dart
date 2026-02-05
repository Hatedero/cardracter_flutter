

import 'package:cardracter_flutter/app/api/api.dart';
import 'package:cardracter_flutter/app/model/card.dart';


final cardRepository = _CardRepository();

class _CardRepository {

  Future<Cards> getCards() async{
    print("called getCards  !");
    return apiCard.getCards();
  }

  Future<Card> getCard(int id) async {
    return apiCard.getCard(id);
  }

  Future<bool> saveCard(Card card) async {
    return apiCard.saveCard(card);
  }
}