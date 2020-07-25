import 'package:flutter/material.dart';
import './result.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 8},
        {'text': 'Red', 'score': 8},
        {'text': 'Blue', 'score': 2},
        {'text': 'White', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 4},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite Avengers\' movie?',
      'answers': [
        {'text': 'Avengers', 'score': 1},
        {'text': 'Avengers 2', 'score': 1},
        {'text': 'Avengers 3', 'score': 1},
        {'text': 'Avengers 4', 'score': 1},
      ]
    },
  ];

  var _questionsIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
     setState(() {
    _questionsIndex = 0;
    _totalScore = 0;
     });

  }

  void _answerQuestion(int score) {
    var newValue = _questionsIndex + 1;

    _totalScore += score;
    setState(() {
      _questionsIndex = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionsIndex < _questions.length
              ? Quiz(
                  questionsIndex: _questionsIndex,
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                )
              : Result(
                  resultScore: _totalScore,
                  resetQuiz: _resetQuiz
                )),
    );
  }
}
