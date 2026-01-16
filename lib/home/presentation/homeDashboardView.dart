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

    final homeNotifier = context.watch<HomeDashboardNotifier>();


    final cards = context.watch<HomeDashboardNotifier>().cards;

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
              itemCount: cards?.length,
              itemBuilder: (BuildContext context, int index) {
                print(cards?[index]);
                if (cards?[index] != null)
                  return CardPreview(card: cards![index]);
            })
          ],
        ),
      ),
    );
  }
}
