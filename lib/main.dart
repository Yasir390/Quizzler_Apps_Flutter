import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

 checkAnswer (bool userPickedAnswer){

   bool correctAns=quizBrain.getCorrectAnswer();
   setState(() {

     if (quizBrain.isFinished() == true) {

       Alert(
         context: context,
         title: 'Finished!',
         desc: 'You\'ve reached the end of the quiz.',
       ).show();

       quizBrain.reset();
       scoreKeeper = [];
     }

     else {
       if (userPickedAnswer == correctAns) {
         scoreKeeper.add(Icon(
           Icons.check,
           color: Colors.green,
         ));
       } else {
         scoreKeeper.add(Icon(
           Icons.close,
           color: Colors.red,
         ));
       }
       quizBrain.nextQuestion();
     }
   });
 }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                  onPressed: (){
                    checkAnswer(true);
                  },
                  child: Text("True",style: TextStyle(color: Colors.white,fontSize: 24),)
              ),
            )
        ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15),
              child:TextButton(
                  onPressed: (){
                    checkAnswer(false);
                  },
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                  child: Text("False",style:
                  TextStyle(color: Colors.white,fontSize: 24),)
              ),
            )
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
