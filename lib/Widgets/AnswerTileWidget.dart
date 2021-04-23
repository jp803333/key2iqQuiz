import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerTile extends StatefulWidget {
  final Function func;
  final String answer;
  final bool selected, wrongAnswer, submitted;
  const AnswerTile({
    Key? key,
    required this.func,
    required this.answer,
    required this.selected,
    required this.wrongAnswer,
    required this.submitted,
  }) : super(key: key);

  @override
  _AnswerTileState createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: !widget.submitted ? () => widget.func() : null,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: widget.selected
            ? BoxDecoration(
                color: widget.submitted
                    ? widget.wrongAnswer
                        ? Colors.red.shade400
                        : Colors.green
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 16,
                  )
                ],
              )
            : widget.submitted && !widget.wrongAnswer
                ? BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(0, 2),
                        spreadRadius: 2,
                        blurRadius: 16,
                      )
                    ],
                  )
                : null,
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: widget.selected
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 20),
            Text(
              widget.answer,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
