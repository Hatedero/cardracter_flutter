import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget{
  const TextLabel({super.key, required this.title, required this.label});
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
        ),
        height: 20,
        width: 500,
        child: Text(label,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
          ),
          height: 50,
          width: 500,
          child: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        )
      ],
    );
  }
}