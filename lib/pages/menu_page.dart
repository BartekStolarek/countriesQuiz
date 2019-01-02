import 'package:flutter/material.dart';

import '../pages/questions_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.lightBlue,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuestionsPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Welcome!", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text("Tap to start guessing!", style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold))
          ]
        )
      )
    );
  }
}