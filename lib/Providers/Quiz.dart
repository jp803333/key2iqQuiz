import 'package:flutter/cupertino.dart';
import 'package:key2iqassignment/Data/Questions.dart';

class Quiz extends ChangeNotifier {
  List<MCQState> mcqs = List.generate(mcq.length, (index) => MCQState());
  void changeOption(int questionIndex, int optionIndex) {
    if (optionIndex == mcqs[questionIndex].selectedIndex) {
      mcqs[questionIndex].selectedIndex = null;
    } else {
      mcqs[questionIndex].selectedIndex = optionIndex;
    }
    notifyListeners();
  }

  void reset(int questionIndex) {
    if (!mcqs[questionIndex].submitted) {
      mcqs[questionIndex] = MCQState();
      notifyListeners();
    }
  }

  void submitAnswer(int questionIndex) {
    mcqs[questionIndex].submitted = true;
    notifyListeners();
  }
}

class MCQState {
  int? selectedIndex;
  bool answerType = false;
  bool submitted = false;
}
