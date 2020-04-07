import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function handleQuestionChanged;

  Quiz(
      {@required this.questions,
      @required this.handleQuestionChanged,
      @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Question(
        questions[questionIndex]['questionText'],
      ),
      // dart doesnt know this list below is a list so we use as to the type
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        return Answer(
            () => handleQuestionChanged(answer['score']), answer['text']);
      }).toList(),
    ] //to make/generate it a list
        );
  }
}
