import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key2iqassignment/Models/MCQ.dart';
import 'package:key2iqassignment/Widgets/AnswerTileWidget.dart';

class QuestionController extends ChangeNotifier {
  bool reset = false;

  void resetQuestion() {
    reset = true;
    notifyListeners();
    Timer(Duration(milliseconds: 10), () {
      reset = false;
    });
  }
}

class QuestionWidget extends StatefulWidget {
  final MCQ mcq;
  final Function onContinue;
  final QuestionController controller;
  const QuestionWidget({
    Key? key,
    required this.mcq,
    required this.onContinue,
    required this.controller,
  }) : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selectedIndex;
  bool submitted = false;
  bool answerType = false;

  @override
  Widget build(BuildContext context) {
    if (widget.controller.reset && !submitted) {
      selectedIndex = null;
      answerType = false;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(height: 10),
            submitted
                ? Noti(
                    answerType: answerType,
                  )
                : SizedBox(),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIC WARMUPS",
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Logic Puzzles - Intermediate Warmup",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              widget.mcq.data,
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 20),
            ...List.generate(
              widget.mcq.answers.length,
              (index) => AnswerTile(
                answer: widget.mcq.answers[index],
                func: () {
                  if (selectedIndex == index) {
                    selectedIndex = null;
                  } else {
                    selectedIndex = index;
                  }
                  setState(() {});
                },
                selected:
                    selectedIndex == null ? false : selectedIndex == index,
                wrongAnswer: widget.mcq.correctAnswer - 1 != index,
                submitted: submitted,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: selectedIndex != null && !submitted
                  ? () {
                      submitted = true;
                      answerType =
                          widget.mcq.correctAnswer - 1 == selectedIndex;
                      setState(() {});
                    }
                  : submitted
                      ? () => widget.onContinue()
                      : null,
              child: Container(
                width: double.infinity,
                height: 50,
                color: selectedIndex != null ? Colors.black : Colors.grey,
                child: Center(
                  child: Text(
                    submitted ? "Continue" : "Submit",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class Noti extends StatelessWidget {
  final bool answerType;
  const Noti({
    Key? key,
    required this.answerType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: answerType ? Colors.green : Colors.red,
      ),
      child: Center(
        child: Text(answerType ? "Correct" : "Wrong",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
            )),
      ),
    );
  }
}
