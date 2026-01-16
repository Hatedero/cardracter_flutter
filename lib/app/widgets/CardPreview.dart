import 'package:cardracter_flutter/app/widgets/CategoryPreview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;

import '../domain/Card.dart';


class CardPreview extends StatelessWidget {
  const CardPreview({super.key, required this.card});

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
                  CategoryPreview(category: category)
              ],
            )
          ],
        );
  }
}