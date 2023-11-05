import 'package:flutter/material.dart';

class GetText extends StatelessWidget {
  const GetText({super.key, required this.textvalue, required this.color});


  final String textvalue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      textvalue,
      style: TextStyle(fontSize: 20, color: color),
    );
  }
}
