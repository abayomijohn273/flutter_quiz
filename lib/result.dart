import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;
  Result(this.resultScore, this.reset);

  // create a getter. getter dont recieve argument
  String get resultPhrase {
    var resultText;
    if (resultScore <= 30) {
      resultText = "Youu are pretty awesome";
    } else if (resultScore >= 40 && resultScore <= 80) {
      resultText = "You are not that bad";
    } else {
      resultText = "You are bad anyways!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: reset,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
