import 'package:flutter/material.dart';
import './quiz_page.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget{

  final int score;
  final int totalQuestions;

  ScorePage(this.score,this.totalQuestions);


  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your score is", style: new TextStyle(color: Colors.white30,fontSize: 40.0,fontWeight: FontWeight.bold)),
          new Text(score.toString() +"/"+ totalQuestions.toString(), style: new TextStyle(color: Colors.white30,fontSize: 30.0,fontWeight: FontWeight.bold)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white70,
            iconSize: 70.0,
            onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPages()) , (Route route)=> route == null),
          )
        ],
      ),

    );
  }


}