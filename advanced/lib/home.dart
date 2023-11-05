import 'package:advanced/data.dart';
import 'package:advanced/questions.dart';
import 'package:advanced/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget? screen;
  String? screenname;
  List<String> selectedAnswers = [];


  @override
  void initState() {
    setState(() {
      screenname = "Quitz";
      //screen = Quitz(change);
    });
    super.initState();
  }

  void change() {
    setState(() {
      screenname = "Questions";
      //screen = const Question();
    });
  }

  void choosed(String value) {
    selectedAnswers.add(value);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        screenname = "Results";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenwidget;

    // final Widget screenwidget =
    //     (screenname == "Quitz") ? Quitz(change) : const Question();
    if (screenname == "Questions") {
      screenwidget = Question(onChoose: choosed);
    } else if (screenname == "Quitz") {
      screenwidget = Quitz(change);
    } else {
      screenwidget = Results(selectedAns: selectedAnswers);
    }
    return Scaffold(

        // backgroundColor: Colors.deepPurple,
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 159, 111, 240),
                    Color.fromARGB(255, 128, 63, 241)
                  ]),
            ),
            child: screenwidget));
  }
}

class Quitz extends StatelessWidget {
  const Quitz(this.pagechange, {super.key});
  final void Function() pagechange;
  // const Quitz({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
              opacity: 0.6,
              child: Image.asset('assets/images/quiz-logo.png',
                  height: 500, width: 200)),
          // Image.asset('assets/images/quiz-logo.png',
          //     height: 500, width: 200, color: Colors.red),
          const SizedBox(height: 20),
          Text(
            "Learn Flutter the fun way",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: pagechange,
            style: OutlinedButton.styleFrom(
                shadowColor: Colors.yellow,
                foregroundColor: Colors.white,
                surfaceTintColor: Colors.greenAccent),
            label: const Text("Start Quitz"),
          )
        ],
      ),
    );
  }
}
