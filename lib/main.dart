import 'package:cardracter_flutter/account/view/account_view.dart';
import 'package:cardracter_flutter/card_details/view/card_details_view.dart';
import 'package:cardracter_flutter/new_card/view/new_card_view.dart';
import 'package:cardracter_flutter/home/presentation/home_dashboard_view.dart';
import 'package:cardracter_flutter/home/presentation/home_dashboard_notifier.dart';
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
      ],
      child: MaterialApp(
        initialRoute: "/home",
        title: 'Cardracter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          "/home" : (context) => HomeDashboardView(),
          "/new_card" : (context) => NewCardView(),
          "/card_details" : (context) => CardDetailsView(),
          "/account" : (context) => AccountView(title: "account"),
          "/log_out" : (context) => HomeDashboardView(),
        },
        home: const HomeDashboardView(),
      )
    );
  }
}
