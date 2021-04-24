import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key2iqassignment/Models/MCQ.dart';
import 'package:key2iqassignment/Providers/Quiz.dart';
import 'package:key2iqassignment/Widgets/AnswerTileWidget.dart';

class QuestionWidget extends StatefulWidget {
  final MCQ mcq;
  final Function onContinue;
  final MCQState maqState;
  const QuestionWidget({
    Key? key,
    required this.mcq,
    required this.onContinue,
    required this.maqState,
  }) : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(height: 10),
            widget.maqState.submitted
                ? Noti(answerType: widget.maqState.answerType)
                : SizedBox(),
            SizedBox(height: 10),
            _HeadLine(),
            SizedBox(height: 20),
            Text(
              widget.mcq.data,
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500),
            ),
            Line(),
            SizedBox(height: 20),
            ...List.generate(
              widget.mcq.answers.length,
              (index) => AnswerTile(
                answer: widget.mcq.answers[index],
                func: () {
                  if (widget.maqState.selectedIndex == index) {
                    widget.maqState.selectedIndex = null;
                  } else {
                    widget.maqState.selectedIndex = index;
                  }
                  setState(() {});
                },
                selected: widget.maqState.selectedIndex == null
                    ? false
                    : widget.maqState.selectedIndex == index,
                wrongAnswer: widget.mcq.correctAnswer - 1 != index,
                submitted: widget.maqState.submitted,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: widget.maqState.selectedIndex != null &&
                      !widget.maqState.submitted
                  ? () {
                      widget.maqState.submitted = true;
                      widget.maqState.answerType =
                          widget.mcq.correctAnswer - 1 ==
                              widget.maqState.selectedIndex;
                      setState(() {});
                    }
                  : widget.maqState.submitted
                      ? () => widget.onContinue()
                      : null,
              child: Container(
                width: double.infinity,
                height: 50,
                color: widget.maqState.selectedIndex != null
                    ? Colors.black
                    : Colors.grey,
                child: Center(
                  child: Text(
                    widget.maqState.submitted ? "Continue" : "Submit",
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
    //   },
    // );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade400,
    );
  }
}

class _HeadLine extends StatelessWidget {
  const _HeadLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.green),
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
