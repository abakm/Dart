import 'package:flutter/material.dart';
import 'package:multi_screen_app/data/Items.dart';
import 'package:multi_screen_app/screens/categories.dart';
import 'package:multi_screen_app/screens/items.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  final List<Item> favourties = [];
  void favourite(Item item) {
    if (favourties.contains(item)) {
      setState(() {
        favourties.remove(item);
      });
      ShowMessage("Item removed from favourites");
    } else {
      setState(() {
        favourties.add(item);
      });
      ShowMessage("Item added to favourites");
    }
  }

  void ShowMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _selected(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activatePage = CategoryScreen(favourite: favourite);
    var activateTitle = "Categories";
    if (_selectedIndex == 1) {
      activatePage = ItemsScreen(
        items: favourties,
        favourite: favourite,
      );
      activateTitle = "Favourties";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activateTitle),
      ),
      body: activatePage,
      // drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selected(index);
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourties")
        ],
      ),
    );
  }
}
