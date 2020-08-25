import 'package:flutter/material.dart';

class Question{
  String question;
  bool answer;
  Question(String question,bool answer){
    this.question=question;
    this.answer=answer;
  }
  bool isTrue(bool answer){
    return answer==this.answer;
  }
}

Icon addAnswer(bool isCorrect){
  return Icon(
    isCorrect?Icons.check:Icons.cancel,
    color:isCorrect?Colors.green:Colors.red,
  );
}

List<Question> question_library =[
  Question('You can lead a cow down stairs but not up stairs.',false),
  Question('Approximately one quarter of human bones are in the feet.',true),
  Question('A slug\'s blood is green.',true),
  Question('Python is a OOP language.',true),
  Question('Dart is awesome.',true),
  Question('C++ is known for being beginner friendly.',false),
  Question('China has the largest population in the world.',true),
  Question('India has over a population of over 1 billion.',true),
  Question('The first law of Newton is F= m x a.',false),
  Question('Green is created from blue and yellow.',true),
  Question('Plato was from Greece.',true),
  Question('Java is older than Python.',false),
  Question('Sea water is less dense then lake water.',false),
  Question('Albania has the highest coffee shops per million of population.',true),
  Question('Flutter is Dart framework.',true),
  Question('Flutter can be used cross-platform.',true),
];