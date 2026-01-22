import 'package:cardracter_flutter/cardDetails/view/card_details_view.dart';
import 'package:cardracter_flutter/home/presentation/home_dashboard_notifier.dart';
import 'package:cardracter_flutter/home/presentation/home_dashboard_view.dart';
import 'package:cardracter_flutter/newCard/presentation/new_card_notifier.dart';
import 'package:cardracter_flutter/newCard/presentation/new_card_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeDashboardNotifier()),
        ChangeNotifierProvider(create: (context) => NewCardNotifier())
      ],
      child: MaterialApp(
        initialRoute: "/home",
        title: 'Cardracter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          "/home": (context) => HomeDashboardView(),
          "/cardDetails": (context) => CardDetailsView(),
          "/newCard": (context) => NewCardView()
        },
      ),
    );
  }
}
