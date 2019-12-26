import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _ontap;
  AnswerButton(this._answer , this._ontap);

  @override
  Widget build(BuildContext context){

      return new Expanded(
            child: new Material(
              color: _answer == true ? Colors.greenAccent : Colors.redAccent,
              child: new InkWell(
                onTap: () => _ontap(),
                child: new Center(
                  child: new Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.white54,width: 5.0)
                    ),
                    padding: new EdgeInsets.all(20.0),
                    child: new Text(_answer == true ? "TRUE" : "FALSE", style: new TextStyle(color: Colors.white54 , fontSize: 85.0, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          );



  }



}