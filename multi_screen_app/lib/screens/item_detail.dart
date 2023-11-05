import 'package:flutter/material.dart';
import 'package:multi_screen_app/data/Items.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.favourite, required this.item});

  final Item item;
  final void Function(Item item) favourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.title),
          actions: [
            IconButton(
                onPressed: () {
                  favourite(item);
                },
                icon: Icon(Icons.star))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.network(item.imageUrl,
                height: 300, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 8),
            for (final ingredient in item.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 8),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 8),
            for (final step in item.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              )
          ]),
        ));
  }
}
