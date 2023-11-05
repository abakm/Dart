import 'package:flutter/material.dart';
import 'package:scratch/dies.dart';
// import 'package:scratch/widgets.dart';

const start = Alignment.topLeft;
const end = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {required this.color1, required this.color2, super.key});

  const GradientContainer.purple({super.key})
      : color1 = Colors.red,
        color2 = Colors.blueAccent;

  final Color color1;
  final Color color2;

  // ignore: empty_constructor_bodies
  @override
  Widget build(context) {
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color1, color2], begin: start, end: end)),
          child: Center(child: Die())),
    );
  }
}
