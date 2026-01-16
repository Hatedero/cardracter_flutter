import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;

import '../model/category.dart';
import '../model/attribute.dart';


class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(category.title),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var attribute in category.attributes)
                  Text(attribute.value)
              ],
            )
          ],
        );
  }
}