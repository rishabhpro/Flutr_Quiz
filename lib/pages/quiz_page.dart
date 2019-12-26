import 'package:flutter/material.dart';
import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/overlays.dart';
import './score_page.dart';


class QuizPage extends StatefulWidget {
 @override
State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

Question currentquestion;
  Quiz quiz = new Quiz([
    new Question("Is Delhi Capital of India ?", true),
    new Question("Is Kothrapali married ?", false),
    new Question("Flutter is awesome ? ", true),

  ]);

  String questionText;
   int questionNumber;
   bool isCorrect;
   bool overlayVisibility = false;
  
  @override
  void initState() {
    super.initState();
    currentquestion = quiz.nextQuestion;
    questionText = currentquestion.question;
    questionNumber = quiz.questionNumber;
  }


  void handleAnswer(bool answer){
    isCorrect = (currentquestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
        overlayVisibility= true;
    });
  }




  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
          new AnswerButton(true , () => handleAnswer(true) ),
          new QuestionText(questionText , questionNumber ),
             new AnswerButton(false, ()=> handleAnswer(false))
          ],
        ),
        overlayVisibility == true ?   new CorrectWrongOverlay(
          isCorrect,
          (){
            if(quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length) ),(Route route) => route == null);
              return;
            }


            currentquestion = quiz.nextQuestion;
            this.setState((){
              overlayVisibility = false;
              questionText = currentquestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ): new Container(),
      ],

    );
  }

}