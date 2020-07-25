import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionsIndex = 0;

  @override
  Widget build(BuildContext context) {

    

    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
      },
      {
        'questionText': 'What\'s your favorite movie?',
        'answers': ['Avengers 1', 'Avengers 2', 'Avengers 3', 'Avengers 4']
      },
    ];

    void answerQuestion() {
      var newValue = _questionsIndex + 1;
      if(questions.length > newValue) {
      setState(() {
        _questionsIndex = newValue;
      });
      }

    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questionText: questions[_questionsIndex]['questionText']),
            ...(questions[_questionsIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
