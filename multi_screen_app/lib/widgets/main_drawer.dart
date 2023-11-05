import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9)
          ])),
          child: Column(
            children: [
              Icon(Icons.fastfood,
                  size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Cooking",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
        ),
        ListTile(
            onTap: () {},
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              "Items",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            )),
        ListTile(
            onTap: () {},
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            )),
      ],
    ));
  }
}
