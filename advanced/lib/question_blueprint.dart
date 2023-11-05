class QuitzQuestion {
  const QuitzQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getshuffledanswers() {
    final List<String> shuffledanswers = List.of(answers);
    shuffledanswers.shuffle();
    return shuffledanswers;
  }
}
