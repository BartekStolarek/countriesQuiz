import 'package:flutter/material.dart';
import 'dart:math';

class AnswerOverlay extends StatefulWidget {

  final bool _isCorrect;
  final VoidCallback _onTap;

  AnswerOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => new AnswerOverlayState();
}

class AnswerOverlayState extends State<AnswerOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * PI,
                child: new Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0)
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect == true ? "Correct!" : "Wrong!", style: new TextStyle(color: Colors.white, fontSize: 30.0))
          ]
        )
      )
    );
  }
}