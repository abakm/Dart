import 'dart:math';

import 'package:flutter/material.dart';

final ramdom = Random();

class Die extends StatefulWidget {
  Die({super.key});

  @override
  State<Die> createState() {
    return _DieSate();
  }
}

class _DieSate extends State<Die> {
  // var dieimage = 'assets/images/dice-1.png';
  int diceno = 1;

  void rolldie() {
    setState(() {
      diceno = ramdom.nextInt(6) + 1;
      // dieimage = 'assets/images/dice-$diceno.png';
    });
  }

  @override
  Widget build(Context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'assets/images/dice-$diceno.png',
        height: 200,
        width: 100,
      ),
      // const GetText(
      //   textvalue: "Hello World",
      //   color: Color.fromARGB(255, 228, 29, 228),
      // ),
      const SizedBox(height: 20),
      TextButton(
          onPressed: rolldie,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              foregroundColor: Colors.amber,
              textStyle: const TextStyle(fontSize: 25)),
          clipBehavior: Clip.hardEdge,
          child: const Text("Click die"))
    ]);
  }
}
