/*
import 'package:flutter/material.dart';

enum CardType { Character, Collection }

// Assumes Card, MultiCategoryCard, CollectionCard already exist
class SimplifiedCardVisual extends StatelessWidget {
  final Card card;
  final VoidCallback onOption;

  const SimplifiedCardVisual({
    Key? key,
    required this.card,
    required this.onOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (card.type == CardType.Character) {
      final Card multiCard = card;
      return AspectRatio(
        aspectRatio: 0.6,
        child: GestureDetector(
          onTap: onOption,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // Image section (60%)
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/artorias.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                // Text section (40%)
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          multiCard.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    // Placeholder for CollectionCard
    if (card == CardType.Collection) {
      return const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }
}
*/