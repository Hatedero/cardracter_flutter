import 'package:cardracter_flutter/app/widgets/category_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;

import '../domain/card.dart';


class CardPreview extends StatelessWidget {
  const CardPreview({super.key, required this.card});

  final Card card;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(""),
            Text(card.title)
          ],
        );
  }
}