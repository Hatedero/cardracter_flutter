import 'package:cardracter_flutter/app/widgets/cardPreview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;

import '../../app/model/card.dart';

import '../../app/widgets/appBottomBar.dart';

class HomeDashboardView extends StatefulWidget {
  const HomeDashboardView({super.key, required this.title});

  final String title;

  @override
  State<HomeDashboardView> createState() => _HomeDashboardViewState();
}

class _HomeDashboardViewState extends State<HomeDashboardView> {
  List<Card> cards = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: AppBottomBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                print(cards[index]);
                return CardPreview(card: cards[index]);
            })
          ],
        ),
      ),
    );
  }
}
