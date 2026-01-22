import 'package:cardracter_flutter/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPicture extends StatelessWidget{
  const AccountPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black
        ),
        height: 150,
        width: 150,
        child : Image.asset(Assets.imagesDefaultPp ,fit: BoxFit.scaleDown),
    );
  }
}