import 'package:cardracter_flutter/app/widgets/category_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;

import '../model/card.dart';


class CardView extends StatelessWidget {
  const CardView({super.key, required this.card});

  final Card card;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(card.title),
        Image.asset(""),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var category in card.categories)
              CategoryView(category: category)
          ],
        )
      ],
    );
  }
}