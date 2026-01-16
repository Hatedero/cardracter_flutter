import 'package:cardracter_flutter/app/widgets/card_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import '../../app/widgets/app_bottom_bar.dart';
import '../../app/domain/card.dart';

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
            Image.asset("images/nmfcover.jpg"),
            Row(
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pushNamed("/home"),
                    icon: Icon(Icons.home),
                    label: const Text("go to home page"),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pushNamed("/newCard"),
                  icon: Icon(Icons.add),
                  label: const Text("go to modify card page"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
