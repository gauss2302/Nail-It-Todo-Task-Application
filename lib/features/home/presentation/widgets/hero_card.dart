import 'package:flutter/material.dart';

import '../../data/models/item_model.dart';
import '../pages/hero_detail_page.dart';


class HeroCard extends StatelessWidget {
  final ItemModel item;

  const HeroCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HeroDetailPage(item: item),
            ),
          );
        },
        child: Row(
          children: [
            Hero(
              tag: 'hero_${item.id}',
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  width: 100,
                  height: 100,
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}