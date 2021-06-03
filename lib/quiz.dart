import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final int index;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;

  Quiz(this.index, this.questions, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Question(questions[index]['questionText']),
          ...(questions[index]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
                answer['option'], () => answerQuestion(answer['value']));
          }).toList(),
        ],
      ),
    );
  }
}
