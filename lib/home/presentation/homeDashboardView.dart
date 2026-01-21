import 'package:cardracter_flutter/app/widgets/cardPreview.dart';
import 'package:cardracter_flutter/home/presentation/home_dashboard_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      context.read<HomeDashboardNotifier>().getCards();
    });
  }

  @override
  Widget build(BuildContext context) {

    //final homeNotifier = context.watch<HomeDashboardNotifier>();

    //final cards = context.watch<HomeDashboardNotifier>().cards;

    final cards = List.filled(10, Card(0, "title", "", CardType.Character, List.empty()));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: const AppBottomBar(),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: cards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5 / 3.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CardPreview(card: cards[index]);
        },
      ),
    );
  }
}
