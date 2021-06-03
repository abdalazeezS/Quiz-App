import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final answerText;
  final Function function;

  Answer(this.answerText, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: () {
          function();
        },
      ),
    );
  }
}
