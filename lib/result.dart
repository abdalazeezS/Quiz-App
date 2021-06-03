import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  final Function reset;
  final int result;
  final int no;

  TextStyle style = TextStyle(
    fontSize: 25,
  );

  Result(this.reset, this.result, this.no);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Score is $result /$no", style: style),
            SizedBox(height: 20),
            result < 2.5
                ? Text(
                    "Don't cry just try :)",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 45,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "Well Done",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 45,
                    ),
                    textAlign: TextAlign.center,
                  ),
            SizedBox(height: 20),
            // ignore: deprecated_member_use
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.lightBlue,
              splashColor: Colors.white,
              padding: EdgeInsets.all(15),
              child: Text(
                "Re-Take Quiz",
                style: style,
              ),
              onPressed: () {
                reset();
              },
            ),
          ],
        ),
      ),
    );
  }
}
