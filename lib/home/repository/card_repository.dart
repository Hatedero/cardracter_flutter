

import 'package:cardracter_flutter/app/api/api.dart';
import 'package:cardracter_flutter/app/model/card.dart';

import '../../app/model/card.dart';

final cardRepository = _CardRepository();

class _CardRepository {

  Future<Cards> getCards() async{
    return apiCard.getCards();
  }
}