import 'package:cardracter_flutter/cardDetails/view/cardDetailsView.dart';
import 'package:cardracter_flutter/home/presentation/homeDashboardView.dart';
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
        "/home" : (context) => HomeDashboardView(title: "Dashboard"),
        "/cardDetails" : (context) => CardDetailsView(title: "card details")
      },
      home: const HomeDashboardView(title: 'Dashboard'),
    );
  }
}