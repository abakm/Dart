import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: 
        [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(),
            child:null,)
        
        ],
      ));
  }
}
