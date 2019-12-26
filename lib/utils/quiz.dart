import 'package:quiz_app/utils/questions.dart';

class Quiz{
  List<Question> _questions;
  int _QuesIndex = -1;
  int _score = 0;

  Quiz(this._questions){
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _QuesIndex+1;
  int get score => _score;

  Question get nextQuestion {

    _QuesIndex++;
    if(_QuesIndex >= length){
      return null;
    }
    return _questions[_QuesIndex];

  }
   

  void answer(bool isCorrect){
    if(isCorrect) _score++;
  }



}