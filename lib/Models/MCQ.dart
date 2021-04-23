class MCQ {
  String data;
  int correctAnswer;
  List<String> answers;
  MCQ({
    required this.data,
    required this.correctAnswer,
    required this.answers,
  })   : assert(answers.length >= 2),
        assert(correctAnswer > 0 && correctAnswer <= answers.length);
}
