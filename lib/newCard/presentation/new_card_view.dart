import 'package:cardracter_flutter/app/model/attribute_data.dart';
import 'package:flutter/material.dart' hide Card;
import '../../app/model/card.dart';
import '../../app/model/category.dart';

class NewCardView extends StatelessWidget {
  final Card card = Card(0, "Artorias the abyss walker", "", CardType.Character, List.filled(5,
  Category(0, "History : ", 0, List.filled(3,
  Attribute(0, "attribute title", "Died in Oolacile.", 0)))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edition"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                  Text(
                    card.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 32),

                  ...card.categories.map((category) => _buildCategorySection(context, category)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            category.title.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2, color: Colors.blueGrey),
          ),
        ),
        ...category.attributes.map((attr) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              TextField( maxLines: 1000, (attr.value ?? 'N/A')),
            ],
          ),
        )),
        const SizedBox(height: 16),
      ],
    );
  }
}