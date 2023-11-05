import 'package:flutter/material.dart';
import 'package:scratch/gradient.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          backgroundColor: const Color.fromARGB(255, 235, 89, 89),
          // body: GradientContainer(
          //   color1: Color.fromARGB(255, 235, 89, 89),
          //   color2: Color.fromARGB(255, 20, 198, 234))
          //   )
          body: const GradientContainer.purple(),
            
            
            
  )));
}
