import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Questionierre",
        home: Scaffold(
          appBar: AppBar(
            title: Text("First Screen Question"),
          ),
          body: MyQuestion(),
        ));
  }
}

class MyQuestion extends StatefulWidget {
  @override
  _MyQuestionState createState() => _MyQuestionState();
}

class _MyQuestionState extends State<MyQuestion> {
  int questionIndex = 0;
  int totalScore;
  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score': 10},
        {'text': 'White', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 30},
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Lion', 'score': 20},
        {'text': 'Tiger', 'score': 60}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Abayomi', 'score': 10},
        {'text': 'John', 'score': 80},
        {'text': 'Max', 'score': 20},
        {'text': 'Tunde', 'score': 50}
      ]
    },
  ];

  void handleQuestionChanged(int score) {
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return questionIndex < questions.length
        ? Quiz(
            handleQuestionChanged: handleQuestionChanged,
            questions: questions,
            questionIndex: questionIndex,
          )
        : Result(totalScore, resetQuiz);
  }
}
