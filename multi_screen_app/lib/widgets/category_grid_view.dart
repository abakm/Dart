import 'package:flutter/material.dart';
import 'package:multi_screen_app/models/category.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView(
      {super.key, required this.category, required this.onSelect});

  final Category category;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }
}
