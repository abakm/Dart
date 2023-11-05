import 'package:flutter/material.dart';
import 'package:multi_screen_app/data/Items.dart';
import 'package:multi_screen_app/data/dummy.dart';
import 'package:multi_screen_app/models/category.dart';
import 'package:multi_screen_app/screens/items.dart';
import 'package:multi_screen_app/widgets/category_grid_view.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.favourite, super.key});
  final void Function(Item item) favourite;

  void __CategorySelected(BuildContext context, Category category) {
    final List<Item> filtered =
        items.where((item) => item.categories.contains(category.id)).toList();
    if (filtered.isNotEmpty) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemsScreen(
                title: category.title,
                items: filtered,
                favourite: favourite,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final availableCategory in availableCategories)
            CategoryGridView(
                category: availableCategory,
                onSelect: () {
                  __CategorySelected(context, availableCategory);
                })
        ]);
  }
}
