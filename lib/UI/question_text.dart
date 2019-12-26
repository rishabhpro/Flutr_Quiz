import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../pages/quiz_page.dart';

class QuestionText extends StatefulWidget {

  final String _questions;
  final int _questionNumber;

  QuestionText(this._questions,this._questionNumber);
  @override
  State createState()=> new QuestionTextState();

}

class QuestionTextState extends State <QuestionText> with SingleTickerProviderStateMixin {

  Animation<double> _fontsizeAnimation;
  AnimationController _fontsizeAnimationController;

  @override
  void initState(){
    super.initState();
    _fontsizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500),vsync: this);
    _fontsizeAnimation = new CurvedAnimation(parent: _fontsizeAnimationController, curve: Curves.easeInOutQuint);
    _fontsizeAnimation.addListener(() => this.setState((){}));
    _fontsizeAnimationController.forward();
  }

  @override
  void dispose(){
    _fontsizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget._questions != widget._questions){
      _fontsizeAnimationController.reset();
      _fontsizeAnimationController.forward();
    }
  }




  @override
  Widget build(BuildContext context){

    return new Material(
      color: Colors.white70,
      child: new Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text("Statement " + widget._questionNumber.toString()+ ":" +  widget._questions ,
          style: new TextStyle(fontSize: _fontsizeAnimation.value*15),
          ),
        ),
      ),

    );

  }

}
