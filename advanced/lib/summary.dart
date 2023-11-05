import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: 300,
      child:SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return Row(
              children: [
                Text(((data["index"] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(data["text"] as String),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data["choosed"] as String),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data["correct"] as String),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
