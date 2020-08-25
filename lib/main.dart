import 'package:flutter/material.dart';
import 'dart:math';
import 'Questions.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber=0;

  List<Icon> scoreKeeper =[];

  List<Question> questions=new List<Question>.from(question_library);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
               questionNumber<questions.length?questions[questionNumber].question:"You did all the questions!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questions.length != 0) {
                    scoreKeeper.add(
                        addAnswer(questions[questionNumber].isTrue(true)));
                    questions.removeAt(questionNumber);
                    if(questions.length != 0)
                    questionNumber = Random().nextInt(questions.length);
                  }
                  else {
                    questions.addAll(question_library);
                    scoreKeeper.clear();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questions.length != 0) {
                    scoreKeeper.add(
                        addAnswer(questions[questionNumber].isTrue(false)));
                    questions.removeAt(questionNumber);
                    if(questions.length != 0)
                      questionNumber = Random().nextInt(questions.length);
                  }
                  else {
                    questions.addAll(question_library);
                    scoreKeeper.clear();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
