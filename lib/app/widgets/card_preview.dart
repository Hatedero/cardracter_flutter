import 'package:cardracter_flutter/app/widgets/category_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;

import '../model/card.dart';

class CardPreview extends StatelessWidget {
  const CardPreview({super.key, required this.card});

  final Card card;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth * 0.5;

    return SizedBox(
      width: cardWidth,
      child: AspectRatio(
        aspectRatio: 2.5 / 3.5,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade300, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (card.image.isNotEmpty) ...[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      card.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ] else ...[
                const Spacer(),
              ],
              Text(
                card.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}