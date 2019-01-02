import 'package:flutter/material.dart';

import '../pages/menu_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestion;

  ScorePage(this.score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.lightBlue,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MenuPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Your Score:", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text(score.toString() + "/" + totalQuestion.toString(), style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold))
          ]
        )
      )
    );
  }
}