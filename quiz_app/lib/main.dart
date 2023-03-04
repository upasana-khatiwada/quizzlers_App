import 'package:flutter/material.dart';
import 'question.dart';
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
  List<Icon> scoreKeeper = [];
//  List<String> questions = [
//     'You can lead  a cow downstairs but not upstairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.'
//   ];
//   List <bool> answers= [false,true,true];
//  Question q1 = Question(q:'You can lead  a cow downstairs but not upstairs.', a:false);
List <Question> questionBank = [Question(q:'You can lead  a cow downstairs but not upstairs.', a:false),
Question(q: 'Approximately one quarter of human bones are in the feet.', a:true),
Question(q:'A slug\'s blood is green.', a: true)];

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: const  EdgeInsets.all(10.0),
            child: Center(
              child: Text(
               // 'This is where the question wil go.',
               questionBank[questionNumber].questionText,

                textAlign: TextAlign.center,
                style:const TextStyle(
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
                bool correctAnswer= questionBank[questionNumber].questionAnswer;
                if(correctAnswer==true)
                {
                  const Icon(
              Icons.check,
              color: Colors.green,
            );
                }
                else{
                  const Icon(
              Icons.close,
              color: Colors.red,
            );
                }
                setState(() {
                   questionNumber++;
                });
               
                //the user picked true
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
                   bool correctAnswer= questionBank[questionNumber].questionAnswer;
                  if(correctAnswer==false)
                {
                  const Icon(
              Icons.check,
              color: Colors.green,
            );
                }
                else{
                  const Icon(
              Icons.close,
              color: Colors.red,
            );
                }
                setState(() {
                   questionNumber++;
                });  
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
           children:scoreKeeper,
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
