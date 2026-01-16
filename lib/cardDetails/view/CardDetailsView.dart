import 'package:cardracter_flutter/app/widgets/CardPreview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import '../../app/widgets/AppBottomBar.dart';
import '../../app/domain/Card.dart';

class CardDetailsView extends StatefulWidget {
  const CardDetailsView({super.key, required this.title});

  final String title;

  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {
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
