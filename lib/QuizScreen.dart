import 'package:flutter/material.dart';
import 'package:key2iqassignment/Data/Questions.dart';

import 'package:key2iqassignment/Widgets/QuestionWidget.dart';
import 'package:key2iqassignment/Widgets/StepCounterWidget.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int done = 0;
  int total = mcq.length + 1;
  PageController _pageController = PageController(initialPage: 0);
  List<QuestionController> questionControllers =
      List.generate(mcq.length, (index) => QuestionController());
  List<QuestionWidget> questionWidgets = [];

  @override
  void initState() {
    questionWidgets = List.generate(
      mcq.length,
      (index) => QuestionWidget(
        controller: questionControllers[index],
        mcq: mcq[index],
        onContinue: () {
          done = index + 1;
          _pageController.animateToPage(
            done,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
          );
          setState(() {});
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: StepCounter(
          done: done,
          total: total,
        ),
        actions: done < (total - 1)
            ? [
                IconButton(
                  icon: Icon(Icons.refresh),
                  tooltip: 'refresh',
                  onPressed: () {
                    questionControllers[done].resetQuestion();
                    setState(() {});
                  },
                ),
              ]
            : null,
      ),
      body: PageView(
        controller: _pageController,
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          done = value;
          setState(() {});
        },
        children: [
          ...questionWidgets,
          Center(
            child: Text('You have answered all questions succesfully'),
          )
        ],
      ),
    );
  }
}
