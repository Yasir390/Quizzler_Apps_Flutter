
import 'package:quizzler/questions.dart';

class QuizBrain{

  int _questionNumber =0;

  List<Question> _questionBank=[
    Question(q:"Man is Mortal",a: true),
    Question(q: "Flutter is Framework",a: true),
    Question(q:"Mango is a Animal",a: false),
    Question(q:"Laptop has four legs",a: false),
    Question(q:"Argentina won four worldcup",a: false),
    Question(q:"Messi is the player of UAE",a: false),
    Question(q:"Salman Khan is the star of Bollywood",a: true),
    Question(q:"He is the 3rd person singular number",a: true),
    Question(q:"Yesterday is a future tense",a: false),
    Question(q:"Trees gives us Oxygen",a: true),
  ];

  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
  }

  String getQuestionText(){
   return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer(){
   return _questionBank[_questionNumber].questionAns;
  }


  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }


}

