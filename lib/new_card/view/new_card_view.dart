import 'package:cardracter_flutter/app/widgets/card_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import '../../app/model/card.dart';
import '../../app/widgets/app_bottom_bar.dart';

class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  final String title = "Create a card";

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
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
                onPressed: () => Navigator.of(context).pushNamed("/card_details"),
                icon: Icon(Icons.info),
                label: const Text("go to detail"),
            ),
          ],
        ),
      ),
    );
  }
}
