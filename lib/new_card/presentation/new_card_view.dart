import 'dart:ffi';

import 'package:cardracter_flutter/app/widgets/app_text_field.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';
import '../../app/model/category.dart';
import 'new_card_notifier.dart';

class NewCardView extends StatefulWidget {
  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      final notifier = context.read<NewCardNotifier>();
      notifier.createCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<NewCardNotifier>();

    var card = context.watch<NewCardNotifier>().card;

    if (card != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Edition"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            notifier.saveCard();
          },
          child: const Icon(Icons.check),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (card.image.isNotEmpty)
                Image.asset(
                  card.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                )
              else
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported, size: 50),
                ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    AppTextField(
                      defaultValue: card.title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      onFinished: (value) =>
                          notifier.modifyCardTitle(newTitle: value),
                    ),
                    const Divider(height: 32),

                    ...card.categories.map(
                      (category) => _buildCategorySection(context, category),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text('Nouvelle Catégorie'),
                          onPressed: notifier.addNewCategory,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Text("No card");
  }

  Widget _buildCategorySection(BuildContext context, Category category) {
    final notifier = context.watch<NewCardNotifier>();

    void addAttribute() {
      notifier.addNewAttribute(category.categoryId);
    }

    void deleteCategory(int id) {
      notifier.deleteCategory(id);
    }

    void deleteAttribute(int id) {
      notifier.deleteAttribute(id);
    }

    return Dismissible(
      key: Key(category.categoryId.toString()),
      onDismissed: (direction) {
        deleteCategory(category.categoryId);
      },
      background: Container(color: Colors.red, child: Icon(Icons.delete)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AppTextField(
              defaultValue: category.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.blueGrey,
              ),
              onFinished: (title) {
                notifier.modifyCategoryTitle(
                  newTitle: title,
                  categoryId: category.categoryId,
                );
              },
            ),
          ),
          ...category.attributes.map(
            (attribute) => Dismissible(
              key: Key(attribute.attributeId.toString()),
              onDismissed: (direction) {
                deleteAttribute(attribute.attributeId);
              },
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(15, 0, 0, 0),
                        child: AppTextField(
                          defaultValue: attribute.value ?? 'N/A',
                          onFinished: (newValue) {
                            notifier.modifyAttributeValue(
                              newValue: newValue,
                              attributeId: attribute.attributeId,
                              categoryId: category.categoryId,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Nouvel Attribut'),
            onPressed: addAttribute,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
