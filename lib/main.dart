import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/menu_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MaterialApp(
      home: new MenuPage(),
    ));
  });
}
