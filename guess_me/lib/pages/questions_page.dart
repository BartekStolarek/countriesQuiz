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

  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;
  Country currentCountry;

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
    currentCountry = countries.nextCountry;
    questionNumber = countries.questionNumber;
  }

  List<String> generateAnswers() {
    List<String> randomCountries = new List<String>();
    randomCountries.add(currentCountry.name);

    for(int i = 0; i <= 2; i++) {
      String randomCountry = countries.randomCountry.name;

      while(randomCountries.contains(randomCountry)) {
        randomCountry = countries.randomCountry.name;
      }
      randomCountries.add(countries.randomCountry.name);
    }
    randomCountries.shuffle();
    return randomCountries;
  }

  void checkAnswer(String answer) {
    isCorrect = (currentCountry.name == answer);
    countries.answer(isCorrect);

    this.setState(() { overlayShouldBeVisible = true; });
  }

  @override
  Widget build(BuildContext context) {
      return new Stack(
        fit: StackFit.expand,
        children: <Widget> [
          new Column(
            children: <Widget>[
              new TitleBox('Question ' + countries.questionNumber.toString() + '/5'),
              new QuestionBox(currentCountry.currency),
              new AnswersBox(generateAnswers(), checkAnswer)
            ]
          ),
          overlayShouldBeVisible == true ? new AnswerOverlay(
          isCorrect,
          () {
            if (questionNumber == 5) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(countries.score, 5)), (Route route) => route == null);
              return;
            }
            currentCountry = countries.nextCountry;
            this.setState((){
              overlayShouldBeVisible = false;
              questionNumber = countries.questionNumber;
            });
          }
          ) : new Container()
        ],
      );
  }
}