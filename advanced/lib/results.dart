import 'package:advanced/data.dart';
import 'package:advanced/home.dart';
import 'package:advanced/summary.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({super.key, required this.selectedAns});
  final List<String> selectedAns;

  List<Map<String, Object>>  get getsummarydata{
    final List<Map<String, Object>> questionSummary = [];
    for (var i = 0; i < selectedAns.length; i++) {
      questionSummary.add({
        "index": i,
        "text": questions[i].text,
        "correct": questions[i].answers[0],
        "choosed": selectedAns[i]
      });
    }
    return questionSummary;
  }

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = questions.length;
    final List<Map<String, Object>> summarydata = getsummarydata;
    final int correctQuestions = summarydata.where((data) {
      return data["correct"] == data["choosed"];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You answered $correctQuestions out of $totalQuestions"),
              Summary(summarydata: getsummarydata),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    const Home();
                  },
                  child: const Text("Go back"))
            ],
          ),
        ));
  }
}
