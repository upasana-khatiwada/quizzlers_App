import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

//creating an object for class
QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(33, 33, 33, 1),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //this keeps the track of user answer is correct or not by showing correct icon for correct answer and close answer for wrong answer
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickedAnswer) {
    //gets the answer from the return value of getanswer
    setState(() {
      if(quizBrain.isFinished()==true){
        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

          Alert(context: context, title: "Finished!", desc: "You have reached the end of the quiz.").show();

          //reset the questionNumber,
          quizBrain.reset();

          //empty out the scoreKeeper.
          scoreKeeper= [];

      }
    else{
    bool correctAnswer = quizBrain.getCorrectAnswer();

      //if the value matches with the answer pressed by the user
    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    }
    
      //after this it increment the question and change the state to next question
      quizBrain.nextQuestion();
    });
  }
  //we can use this method to store question and its corresponding answer in next list with same index value
  //however it is not appropriate for long list so we create a separete class
//  List<String> questions = [
//     'You can lead  a cow downstairs but not upstairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.'
//   ];
//   List <bool> answers= [false,true,true];
//  Question q1 = Question(q:'You can lead  a cow downstairs but not upstairs.', a:false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // 'This is where the question wil go.',
                quizBrain.getQuestionText(),

                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                //the user picked true
                checkAnswer(true);
                // setState(() {
                //   scoreKeeper.add(const Icon(Icons.check,color: Colors.green,),);
                // });
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                onPressed: () {
                  //user picked false
                  checkAnswer(false);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                child: const Text(
                  'False',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
          ),
        ),
        Row(
          children: scoreKeeper,
          //const <Widget>[
          //   Icon(
          //     Icons.check,
          //     color: Colors.green,
          //   ),
          //   Icon(Icons.close,
          //   color: Colors.red,),
          // ],
        )
      ],
    );
  }
}
