import './country.dart';
import 'dart:math';

class Countries {
  List<Country> _countries;
  int _currentCountryIndex = -1;
  int _score = 0;

  Countries(this._countries) {
    _countries.shuffle();
  }

  List<Country> get countries => _countries;
  int get questionNumber => _currentCountryIndex + 1;
  int get length => _countries.length;
  int get score => _score;

  Country get randomCountry {
    Random _random = new Random();
    return countries[_random.nextInt(countries.length)];
  }

  Country get nextCountry {
    _currentCountryIndex++;
    if (_currentCountryIndex >= length) return null;
    return _countries[_currentCountryIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}