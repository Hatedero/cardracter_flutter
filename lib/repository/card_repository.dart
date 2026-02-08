import 'package:cardracter_flutter/app/api/api.dart';
import 'package:cardracter_flutter/app/model/card.dart';

final cardRepository = _CardRepository();

class _CardRepository {

  Future<Cards> getCards() async{
    print("called getCards  !");
    return apiCard.getCards();
  }

  Future<int> getCardHeightsId() async{
    return apiCard.getCardHeightsId();
  }

  Future<Card> getCard(int cardId) async{
    print("called getCard !");
    return apiCard.getCard(cardId);
  }

  Future<int> saveCard(Card card) async {
    return apiCard.saveCard(card);
  }
}