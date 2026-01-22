import 'package:cardracter_flutter/app/api/api.dart';
import 'package:cardracter_flutter/app/model/card.dart';

final cardRepository = _CardRepository();

class _CardRepository {

  Future<Cards> getCards() async{
    print("called getCards  !");
    return apiCard.getCards();
  }

  Future<Card> getCard(int cardId) async{
    print("called getCard!");
    return apiCard.getCard(cardId);
  }
}