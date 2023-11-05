import 'package:advanced/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:advanced/data.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({required this.onChoose, super.key});
  final void Function(String answer) onChoose;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int index = 0;

  void changeIndex(String ans) {
      widget.onChoose(ans);
      setState(() {
        index++;
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[index].text,
              // style: const TextStyle(color: Colors.white),
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...questions[index].getshuffledanswers().map((answer) {
              return AnswerButton(
                  answer: answer,
                  select: () {
                    changeIndex(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
