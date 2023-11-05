import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
 const AnswerButton({super.key,required this.answer, required this.select});

  final String answer;
  final void Function() select;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: select,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        backgroundColor: const Color.fromARGB(255, 46, 2, 53),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
      ),
      child: Text(answer),
    );
  }
}
