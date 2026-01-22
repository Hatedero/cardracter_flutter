import 'package:cardracter_flutter/account/view/account_view.dart';
import 'package:cardracter_flutter/app/model/attribute_data.dart';
import 'package:cardracter_flutter/app/model/category.dart';
import 'package:cardracter_flutter/card_details/view/card_details_view.dart';
import 'package:cardracter_flutter/home/presentation/home_dashboard_view.dart';
import 'package:cardracter_flutter/home/presentation/home_dashboard_notifier.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';
import 'app/model/card.dart';
import 'generated/assets.dart';
import 'new_card/presentation/new_card_notifier.dart';
import 'new_card/presentation/new_card_view.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Card card = Card(-1,"JeanPhilipe",Assets.imagesArtorias,CardType.Character,
        List.filled(4,Category(-1,"test category !",-1,
            List.filled(2,Attribute(-1,"test attribute"," whoa! A debug feature !",-1))
        ))
    );

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
          "/home" : (context) => HomeDashboardView(),
          "/new_card" : (context) => NewCardView(),
          "/card_details" : (context) => CardDetailsView(card:card),
          "/account" : (context) => AccountView(title: "account"),
          "/log_out" : (context) => HomeDashboardView(),
        },
        home: const HomeDashboardView(),
      )
    );
  }
}
