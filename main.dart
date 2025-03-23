import 'package:flutter/material.dart';
import 'package:flutter_app/result.dart';
import './quiz.dart';
import './result.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {'questionText': 'what\'s your favorite color', 'answers': [
      {'text': 'Black', 'score': 10},
      {'text':'Red', 'score': 5},
      {'text': 'Green', 'score':3},
      {'text': 'White', 'score': 1}],
    },

    {'questionText': 'what\'s your favorite animal', 'answers': [
      {'text':'Rabbit','score':3},
      {'text':'Snake','score': 11},
      {'text':'Elephant','score': 5},
      {'text':'Lion','score': 9}],
    },

    {'questionText': 'Who\'s is your favorite instructor', 'answers': [
      {'text':'Samuel','score': 1},
      {'text':'Max','score': 1},
      {'text':'Frank','score':1},
      {'text':'Promise','score':1}],
    },
    //this does not work if question is a const
  ];


  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    //var aBool = true;
    //aBool = false;

    _totalscore += score;


    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length?
          Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,)
              //this is the if statement

          //this is the else statement used as a center widget
        : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
