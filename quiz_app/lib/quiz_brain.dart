import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question( 'You can lead  a cow downstairs but not upstairs.',  false),
    Question(
         'Approximately one quarter of human bones are in the feet.',
         true),
    Question( 'A slug\'s blood is green.',  true),
    Question( 'Buzz Aldrin\'s mother\'s maiden name was "Mooon".',  true),
    Question( 'It is illegal to pee in the ocean in Portugal.', true),
    Question(
         'No piece of square dry paper can be folded in half more than 7 times.',
         false),
    Question( 'Some cats are actually allergic to human.',    true),
    Question(
         'In London,UK,if you happen to die in the house of parliament,you are technically entitled to a state funeral, because the building is considered too sacred a place.',
         false),
    Question(
          'The loudest sound produced by any animal is 188 decibels.That animal is the African Elephant.',
           false),
    Question(
          'The total surface area of two human lungs is approximately 70 square meters.',
           true),
    Question(  'Google was originally called"Backrub"',    true),
    Question(
          'Chocolates affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
           true),
    Question(
          'In West Virginia, USA,if you accidentally hit an animal with your car, you are free to take it home to eat.',
           true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }

    //_questionNumber=0;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

//for question[0]>>>>>> it returns questionBank[0].questionAnswer i.e false
  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
 bool isFinished(){
     if (_questionNumber >= _questionBank.length - 1)
     {
      return true;
     }
     else{
      return false;
     }
  }
  void reset() {
    _questionNumber = 0;
  }
}
