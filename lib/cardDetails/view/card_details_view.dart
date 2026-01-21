import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;

import '../../app/model/card.dart';

class CardDetailsView extends StatefulWidget {
  const CardDetailsView({super.key, required this.title});

  final String title;

  @override
  State<CardDetailsView> createState() => _HomeDashboardViewState();
}

class _HomeDashboardViewState extends State<CardDetailsView> {
  List<Card> cards = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
                onPressed: Navigator.of(context).pop,
                icon: Icon(Icons.home),
                label: const Text("go to home page"),
            ),
          ],
        ),
      ),
    );
  }
}
