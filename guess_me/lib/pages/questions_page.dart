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
  int _allQuestions = 20;
  bool _isCorrect;
  bool _displayOverlay = false;
  Country _currentCountry;
  List<String> _randomCountries;

  Countries countries = new Countries([
    //easy
    new Country('Argentina', 'ARS'),
    new Country('Australia', 'AUD'),
    new Country('Brazil', 'BRL'),
    new Country('Czech Republic', 'CZK'),
    new Country('Egypt', 'EGP'),
    new Country('European Union', 'EUR'),
    new Country('China', 'CNY'),
    new Country('Canada', 'CAD'),
    new Country('Japan', 'JPY'),
    new Country('India', 'INR'),
    new Country('Indonesia', 'IDR'),
    new Country('Israel', 'ILS'),
    new Country('Norway', 'NOK'),
    new Country('Malaysia', 'MYR'),
    new Country('Mexico', 'MXN'),
    new Country('New Zealand', 'NZD'),
    new Country('Qatar', 'QAR'),
    new Country('Russia', 'RUB'),
    new Country('South Africa', 'ZAR'),
    new Country('Switzerland', 'CHF'),
    new Country('Thailand', 'THB'),
    new Country('United Kingdom', 'GBP'),
    new Country('United States', 'USD'),

    //medium
    new Country('Belarus', 'BYN'),
    new Country('Bolivia', 'BOB'),
    new Country('Bosnia', 'BAM'),
    new Country('Bulgaria', 'BGN'),
    new Country('Chile', 'CLP'),
    new Country('Colombia', 'COP'),
    new Country('Costa Rica', 'CRC'),
    new Country('Croatia', 'HRK'), 
    new Country('Denmark', 'DKK'),
    new Country('Georgia', 'GEL'),
    new Country('Ghana', 'GHS'),
    new Country('Hong Kong', 'HKD'),
    new Country('Jamaica', 'JMD'),
    new Country('Kazakhstan', 'KZT'),
    new Country('Kuwait', 'KWD'),
    new Country('North Korea', 'KPW'),
    new Country('South Korea', 'KRW'),
    new Country('Macedonia', 'MKD'),
    new Country('Moldova', 'MDL'),
    new Country('Morocco', 'MAD'),
    new Country('Nigeria', 'NGN'),
    new Country('Paraguay', 'PYG'),
    new Country('Peru', 'PEN'),
    new Country('Poland', 'PLN'),
    new Country('Romania', 'RON'),
    new Country('Serbia', 'RSD'),
    new Country('Singapore', 'BND/SGD'),
    new Country('Sri Lanka', 'LKR'),
    new Country('Tunisia', 'TND'),
    new Country('Turkey', 'TRY'),
    new Country('Ukraine', 'UAH'),
    new Country('Uruguay', 'UYU'),

    //hard
    new Country('Afghanistan', 'AFN'),
    new Country('Albania', 'ALL'),
    new Country('Algeria', 'DZD'),
    new Country('Angola', 'AOA'),
    new Country('Armenia', 'AMD'),
    new Country('Azerbaijan', 'AZN'),
    new Country('Bahrain', 'BHD'),
    new Country('Bangladesh', 'BDT'),
    new Country('Barbados', 'BBD'),
    new Country('Benin', 'XOF'),
    new Country('Botswana', 'BWP'),
    new Country('Burundi', 'BIF'),
    new Country('Cameroon', 'XAF'),
    new Country('Comoros', 'KMF'),
    new Country('Djibouti', 'DJF'),
    new Country('Dominican Rep.', 'DOP'),
    new Country('Eritrea', 'ERN'),
    new Country('Ethiopia', 'ETB'),
    new Country('Fiji', 'FJD'),
    new Country('Haiti', 'HTG'),
    new Country('Honduras', 'HNL'),
    new Country('Iran', 'IRR'),
    new Country('Iraq', 'IQD'),
    new Country('Jordan', 'JOD'),
    new Country('Kenya', 'KES'),
    new Country('Lebanon', 'LBP'),
    new Country('Liberia', 'LRD'),
    new Country('Libya', 'LYD'),
    new Country('Macau', 'MOP'),
    new Country('Madagascar', 'MGA'),
    new Country('Maledives', 'MVR'),
    new Country('Montserrat', 'XCD'),
    new Country('Myanmar', 'MMK'),
    new Country('Nepal', 'NPR'),
    new Country('New Caledonia', 'XPF'),
    new Country('Nicaragua', 'NIO'),
    new Country('Omar', 'OMR'),
    new Country('Pakistan', 'PKR'),
    new Country('Philippines', 'PHP'),
    new Country('Samoa', 'WST'),
    new Country('Sierra Leone', 'SLL'),
    new Country('Somalia', 'SOS'),
    new Country('Sudan', 'SDG'),
    new Country('Suriname', 'SRD'),
    new Country('Swaziland', 'SZL'),
    new Country('Syria', 'SYP'),
    new Country('Tajikistan', 'TJS'),
    new Country('Tanzania', 'TZS'),
    new Country('Tonga', 'TOP'),
    new Country('Turkmenistan', 'TMT'),
    new Country('Uganda', 'UGX'),
    new Country('Uzbekistan', 'UZS'),
    new Country('Vanuatu', 'VUV'),
    new Country('Venezuela', 'VEF'),
    new Country('Vietnam', 'VND'),
    new Country('Yemen', 'YER')

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
              new TitleBox('Question ' + countries.questionNumber.toString() + '/' + _allQuestions.toString()),
              new QuestionBox(_currentCountry.currency),
              new AnswersBox(generateAnswers(), checkAnswer)
            ]
          ),
          _displayOverlay == true ? new AnswerOverlay(
          _isCorrect,
          () {
            if (_questionNumber >= _allQuestions) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(countries.score, _allQuestions)), (Route route) => route == null);
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