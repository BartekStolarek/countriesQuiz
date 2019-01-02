import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  
  final String _question;
  QuestionBox(this._question);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: Colors.lightBlue,
        child: new Center(
          child: new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 5.0),
                  child: new Text('Whose currency is it?', style: new TextStyle(color: Colors.white, fontSize: 25.0))
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 25.0),
                  child: new Text(_question, style: new TextStyle(color: Colors.white, fontSize: 75.0, fontWeight: FontWeight.bold))
                )
              ],
            )
          )
        )
      )
    );
  }
}