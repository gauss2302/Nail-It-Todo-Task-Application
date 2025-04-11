import 'package:flutter/material.dart';

import '../../data/models/item_model.dart';
import '../widgets/hero_card.dart';

class HeroListPage extends StatelessWidget {
  final List<ItemModel> items = [
    ItemModel(
      id: '1',
      title: 'Mountain View',
      imageUrl: 'lib/assets/pics/just_do_it.jpeg',
      description: 'Beautiful mountain landscape you cannot imagine',
    ),
    ItemModel(
      id: '2',
      title: 'Ocean Sunset',
      imageUrl: 'lib/assets/pics/just_do_it.jpeg',
      description: 'Stunning ocean sunset view',
    ),
    ItemModel(
      id: '3',
      title: 'Ocean Sunset',
      imageUrl: 'lib/assets/pics/just_do_it.jpeg',
      description: 'Stunning ocean sunset view',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation Demo')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return HeroCard(item: items[index]);
        },
      ),
    );
  }
}