import 'package:cardracter_flutter/cardDetails/view/card_details_view.dart';
import 'package:cardracter_flutter/home/view/home_dashboard_view.dart';
import 'package:cardracter_flutter/newCard/view/new_card_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/home" : (context) => HomeDashboardView(title: "home page"),
        "/newCard" : (context) => NewCardView(title: "new card"),
        "/cardDetails" : (context) => CardDetailsView(title: "card details")
      },
      home: const HomeDashboardView(title: 'home dashboard'),
    );
  }
}