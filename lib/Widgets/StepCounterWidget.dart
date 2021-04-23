import 'package:flutter/material.dart';

class StepCounter extends StatelessWidget {
  final int total;
  final int done;
  const StepCounter({
    Key? key,
    required this.total,
    required this.done,
  })   : assert(done >= 0),
        assert(total >= done),
        assert(total <= 60),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: double.infinity,
      child: Row(
        children: [
          ...List.generate(2 * done, (index) {
            return index % 2 == 0
                ? Expanded(
                    child: Container(
                      height: 15,
                      color: Colors.black,
                    ),
                  )
                : SizedBox(
                    width: 2,
                  );
          }),
          Expanded(
            child: Container(
              height: 15,
              color: Colors.amber,
            ),
          ),
          ...List.generate(2 * (total - done-1), (index) {
            return index % 2 == 0
                ? Expanded(
                    child: Container(
                      height: 10,
                      color: Colors.grey.shade300,
                    ),
                  )
                : SizedBox(
                    width: 2,
                  );
          })
        ],
      ),
    );
  }
}
