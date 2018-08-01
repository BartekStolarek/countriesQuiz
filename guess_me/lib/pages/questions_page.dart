import 'package:flutter/material.dart';

import '../components/question_box.dart';
import '../components/title_box.dart';
import '../components/answers_box.dart';
import '../components/overlay.dart';

import '../pages/score_page.dart';

import '../utils/country.dart';
import '../utils/countries.dart';

class QuestionsPage extends StatefulWidget {
  @override
  State createState() => new QuestionsPageState();
}

class QuestionsPageState extends State<QuestionsPage> {

  int _questionNumber;
  bool _isCorrect;
  bool _displayOverlay = false;
  Country _currentCountry;
  List<String> _randomCountries;

  Countries countries = new Countries([
    new Country('Argentina', 'ARS'),
    new Country('Australia', 'AUD'),
    new Country('European Union', 'EUR'),
    new Country('Bolivia', 'BOB'),
    new Country('Brazil', 'BRL'),
    new Country('Bulgaria', 'BGN'),
    new Country('Chile', 'CLP'),
    new Country('China', 'CNY'),
    new Country('Colombia', 'COP'),
    new Country('Croatia', 'HRK'),
    new Country('Czech Republic', 'CZK'),
    new Country('Denmark', 'DKK'),
    new Country('Egypt', 'EGP')
  ]);

  @override
  void initState() {
    super.initState();
    _currentCountry = countries.nextCountry;
    _questionNumber = countries.questionNumber;
  }

  List<String> generateAnswers() {
    if (!_displayOverlay) {
      _randomCountries = new List<String>();
      _randomCountries.add(_currentCountry.name);

      for(int i = 0; i <= 2; i++) {
        String randomCountry = countries.randomCountry.name;

        while(_randomCountries.contains(randomCountry)) {
          randomCountry = countries.randomCountry.name;
        }
        _randomCountries.add(randomCountry);
      }
      _randomCountries.shuffle();
      return _randomCountries;
    } else {
      return _randomCountries;
    }
  }

  void checkAnswer(String answer) {
    _isCorrect = (_currentCountry.name == answer);
    countries.answer(_isCorrect);

    this.setState(() { _displayOverlay = true; });
  }

  @override
  Widget build(BuildContext context) {
      return new Stack(
        fit: StackFit.expand,
        children: <Widget> [
          new Column(
            children: <Widget>[
              new TitleBox('Question ' + countries.questionNumber.toString() + '/5'),
              new QuestionBox(_currentCountry.currency),
              new AnswersBox(generateAnswers(), checkAnswer)
            ]
          ),
          _displayOverlay == true ? new AnswerOverlay(
          _isCorrect,
          () {
            if (_questionNumber == 5) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(countries.score, 5)), (Route route) => route == null);
              return;
            }
            _currentCountry = countries.nextCountry;
            this.setState((){
              _displayOverlay = false;
              _questionNumber = countries.questionNumber;
            });
          }
          ) : new Container()
        ],
      );
  }
}