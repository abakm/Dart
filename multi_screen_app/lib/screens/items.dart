import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_screen_app/data/Items.dart';
import 'package:multi_screen_app/screens/item_detail.dart';
import 'package:multi_screen_app/widgets/Item_card_view.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({
    super.key, 
    required this.favourite,
    this.title, required this.items});

  final String? title;
  final List<Item> items;
  final void Function(Item item) favourite;
  void selectItem(BuildContext context, Item item) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => 
        ItemDetail(
          favourite: favourite,
          item: item
          )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ItemCardView(
              item: items[index],
              selectItem: selectItem,
            ));

    if (items.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Oh ! nothing is here",
            ),
            const SizedBox(height: 10),
            Text(
              "Please select different category",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
