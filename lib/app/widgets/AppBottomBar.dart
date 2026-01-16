import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Dashboard',
              icon: const Icon(Icons.home),
              onPressed: () {//go home
                },
            ),
            IconButton(tooltip: 'New Card',
                icon: const Icon(Icons.add),
                onPressed: () {//go card creation page
              }),
          ],
        ),
    );
  }
}