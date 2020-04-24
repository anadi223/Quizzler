import 'package:flutterapp3/question.dart';
class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Only character or integer can be used in switch statement in C Programming', false),
    Question('The return type of malloc function is void in C Programming', false),
    Question('#define is known as preprocessor compiler directive in C Programming', true),
    Question('sizeof( ) is a function that returns the size of a variable in C Programming', false),
    Question('The ++ operator increments the operand by 1, whereas, the -- operator decrements it by 1, in C Programming', true),
    Question('Only character or integer can be used in switch statement in C Programming', false),
    Question('It is necessary that a loop counter must only be an int. It cannot be a float in C Programming', false),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if(_questionNumber<_questionBank.length-1){
     _questionNumber++;
    }
    }

  bool isFinished(){
    if(_questionNumber>=_questionBank.length-1){
      print('yes');
      return true;
    }
    else{
      print('no');
      return false;
    }
  }

  void reset(){
    _questionNumber =0;
  }

  int questionNumber(){
    return _questionBank.length;
  }
}