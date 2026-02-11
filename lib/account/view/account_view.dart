import 'package:cardracter_flutter/app/model/account.dart';
import 'package:cardracter_flutter/app/widgets/account_picture.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app/widgets/app_bottom_bar.dart';
import '../../app/widgets/text_label.dart' show TextLabel;

class AccountView extends StatefulWidget {

  const AccountView({
    super.key,
  });

  final String title = "account";


  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final Account account = Account();

  @override
  Widget build(BuildContext context) {
    final formatedBirth = DateFormat.yMd().format(account.dateOfBirth);
    final formatedJoined = DateFormat.yMd().format(account.dateJoined);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: AppBottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile picture
            Expanded(
              flex: 7,
              child: AccountPicture(),
            ),

            const SizedBox(height: 16),

            // Main account info
            Expanded(
              flex: 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/modifyAccount');
                      },
                      child: const Text('MODIFY PROFILE'),
                    ),
                    const SizedBox(height: 16,),
                    TextLabel(title:account.name,label:"username",),
                    const SizedBox(height: 16),
                    TextLabel(title:account.mail,label:"mail",),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextLabel(title:formatedBirth,label:"Date of birth"),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextLabel(title:formatedJoined,label:"Date joined"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Logout button
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 64,
                maxHeight: 300,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/log_out');
                  },
                  tooltip: 'log out',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}