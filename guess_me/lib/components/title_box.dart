import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  
  final String _title;
  TitleBox(this._title);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Material(
        color: Colors.lightBlue,
        child: new Center(
          child: new Container(
            padding: new EdgeInsets.only(top: 45.0),
            child: new Text(_title, style: new TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold))
          )
        )
      )
    );
  }
}