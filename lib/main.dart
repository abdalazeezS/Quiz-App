import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, Object>> questions = [
    {
      'questionText':
          'Which of the following is not true regarding  hard failure in semiconductor memory?',
      'answers': [
        {'option': 'a permanent defect', 'value': 0},
        {'option': 'can be caused by harsh environmental', 'value': 0},
        {'option': 'a temporary defect', 'value': 1},
      ],
    },
    {
      'questionText':
          'FIFO algorithm replaces that block in the set that has been in the cache longest with no reference to it',
      'answers': [
        {'option': 'True', 'value': 0},
        {'option': 'False', 'value': 1},
      ],
    },
    {
      'questionText':
          'The..... contains a word of data to be written to memory or the word most recently read',
      'answers': [
        {'option': 'MBR', 'value': 1},
        {'option': 'IR', 'value': 0},
        {'option': 'PC', 'value': 0},
        {'option': 'MAR', 'value': 0},
      ],
    },
    {
      'questionText': 'SSDs use more power than HDDs',
      'answers': [
        {'option': 'True', 'value': 0},
        {'option': 'False', 'value': 1},
      ],
    },
    {
      'questionText': 'Which or the following memory types are nonvolatile?',
      'answers': [
        {'option': 'EPROM,', 'value': 0},
        {'option': 'ROM', 'value': 0},
        {'option': 'PROM', 'value': 0},
        {'option': 'All answers are true', 'value': 1},
      ],
    },
  ];
  int _totalScore = 0;

  int _index = 0;

  int num0 = 0, num1 = 0, num2 = 0, num3 = 0, num4 = 0;

  var theme = ThemeData.light();

  var isSwitched = false;

  void answerQuestion(int score) {
    if (_index == 0)
      num0 = score;
    else if (_index == 1)
      num1 = score;
    else if (_index == 2)
      num2 = score;
    else if (_index == 3)
      num3 = score;
    else if (_index == 4) num4 = score;
    _totalScore += score;
    setState(() {
      _index++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  theme = theme == ThemeData.light()
                      ? ThemeData.dark()
                      : ThemeData.light();
                  isSwitched = value;
                });
              },
            )
          ],
          title: Text(
            "Computer Architecture quiz",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          child: _index < questions.length
              ? Quiz(_index, questions, answerQuestion)
              : Result(reset, _totalScore, questions.length),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            if (_index == 1)
              _totalScore -= num0;
            else if (_index == 2)
              _totalScore -= num1;
            else if (_index == 3)
              _totalScore -= num2;
            else if (_index == 4)
              _totalScore -= num3;
            else if (_index == 5) _totalScore -= num4;
            setState(() {
              if (_index > 0) {
                _index--;
              }
            });
          },
        ),
      ),
    );
  }

  void reset() {
    setState(() {
      _index = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
      num3 = 0;
      num4 = 0;
    });
  }
}
