import 'package:cardracter_flutter/app/widgets/card_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';
import '../../app/widgets/app_bottom_bar.dart';
import '../../app/model/card.dart';
import 'card_details_notifier.dart';

class CardDetailsView extends StatefulWidget {

  const CardDetailsView({
    Key? key,
    required this.cardId,
  }) : super(key: key);

  final int cardId;


  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      final notifier = context.read<CardDetailsNotifier>();
      notifier.getCard(widget.cardId);
    });
  }

  @override
  Widget build(BuildContext context) {

    final notifier = context.watch<CardDetailsNotifier>();

    var card = context.watch<CardDetailsNotifier>().card;

    if (card != null) {
      switch (card.type) {
        case CardType.Character:
          return _buildCharacterCard(context, card);

        case CardType.Collection:
          return _buildCollectionCard(context, card);
      }
    } else {
      return Text("Card isn't ready yet");
    }
  }

  Widget _buildCharacterCard(BuildContext context, Card card) {
    return Column(
      children: [
        // Image section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              card.image,
              fit: BoxFit.contain,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
            ),
          ),
        ),

        // Content
        Expanded(
          child: ListView(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      card.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Categories
              Expanded(
                child: Column(
                  children: [
                    for (final category in card.categories) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              category.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.purpleAccent,
                              ),
                            ),
                           for (final attribute in category.attributes)
                              Text(
                                attribute.value ?? "no value",
                                style: const TextStyle(fontSize: 20),
                                textAlign: TextAlign.left,
                              ),

                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCollectionCard(BuildContext context, Card card) {
    return const SizedBox.shrink();
  }
}