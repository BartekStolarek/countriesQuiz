import 'package:flutter/material.dart';

typedef void StringCallback(String answer);

class AnswersBox extends StatelessWidget {

  final List<String> _answers;
  final StringCallback callback;

  AnswersBox(this._answers, this.callback);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      child: new Material(
        color: Colors.lightBlue,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  new Container(
                    height: 50.0,
                    width: 150.0,
                    child: new RaisedButton(
                      onPressed: () => callback(_answers[0]),
                      color: Colors.white,
                      child: new Text(_answers[0], style: new TextStyle(fontSize: 20.0)),
                    )
                  ),

                  new Container(
                    height: 50.0,
                    width: 150.0,
                    child: new RaisedButton(
                      onPressed: () => callback(_answers[1]),
                      color: Colors.white,
                      child: new Text(_answers[1], style: new TextStyle(fontSize: 20.0)),
                    )
                  ),

                ],
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                    new Container(
                    height: 50.0,
                    width: 150.0,
                    child: new RaisedButton(
                      onPressed: () => callback(_answers[2]),
                      color: Colors.white,
                      child: new Text(_answers[2], style: new TextStyle(fontSize: 20.0)),
                    )
                  ),

                  new Container(
                    height: 50.0,
                    width: 150.0,
                    child: new RaisedButton(
                      onPressed: () => callback(_answers[3]),
                      color: Colors.white,
                      child: new Text(_answers[3], style: new TextStyle(fontSize: 20.0)),
                    )
                  ),
                ],
              )
            ],
          )
      )
    );
  }

}
