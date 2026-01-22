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
              onPressed: () => Navigator.of(context).pushNamed("/home")
            ),
            IconButton(tooltip: 'New Card',
                icon: const Icon(Icons.add),
                onPressed: () => Navigator.of(context).pushNamed("/new_card")
            ),
            IconButton(tooltip: 'Account',
                icon: const Icon(Icons.people),
                onPressed: () => Navigator.of(context).pushNamed("/account")
            ),
          ],
        ),
    );
  }
}