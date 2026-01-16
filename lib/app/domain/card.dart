import 'package:cardracter_flutter/app/domain/category.dart';

class Card {
  int id = 0;
  String title = '';
  int image = 0;
  CardType type = CardType.Character;
  List<Category> categories = List.empty();
}

enum CardType { Character, Collection }