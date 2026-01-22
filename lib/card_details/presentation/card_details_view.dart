import 'package:cardracter_flutter/card_details/presentation/card_details_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import '../../app/widgets/app_bottom_bar.dart';
import '../../app/model/card.dart';
import 'package:provider/provider.dart';


class CardDetailsView extends StatefulWidget {

  const CardDetailsView({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Card card;
  final String title = "Card details";

  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<CardDetailsNotifier>().getCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final card = context
        .watch<CardDetailsNotifier>()
        .card ?? widget.card;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        bottomNavigationBar: const AppBottomBar(),
        body: choseCardDetailBody(card)
    );
  }

  Widget choseCardDetailBody(Card card) {
    switch (card.type) {
      case CardType.Character:
        return _CharacterDetailsViewBody(card: card);
      case CardType.Collection:
        return _CollectionDetailsViewBody(card: card);
      default:
        return _CollectionDetailsViewBody(card: card);
    }
  }
}

class _CharacterDetailsViewBody extends StatelessWidget {

  const _CharacterDetailsViewBody({required this.card});
  final Card card;

  @override
  Widget build(BuildContext context) {
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
}

class _CollectionDetailsViewBody extends StatelessWidget {
  /// === Collection card (empty for now, same as Compose) ===

  const _CollectionDetailsViewBody({required this.card});
  final Card card;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}