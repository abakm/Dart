import 'package:flutter/material.dart';

class ItemMetaData extends StatelessWidget {
  const ItemMetaData({super.key, required this.icon, required this.labelvalue});

  final IconData icon;
  final String labelvalue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white,),
        const SizedBox(height: 10,),
        Text(labelvalue, 
            style: const TextStyle(
              color: Colors.white))
      ],
    );
  }
}
