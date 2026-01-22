

import 'package:cardracter_flutter/app/api/api.dart';
import 'package:cardracter_flutter/app/model/card.dart';


final cardRepository = _CardRepository();

class _CardRepository {

  Future<Cards> getCards() async {
    return apiCard.getCards();
  }

  Future<bool> saveCard(Card card) async {
    return apiCard.saveCard(card);
  }
}