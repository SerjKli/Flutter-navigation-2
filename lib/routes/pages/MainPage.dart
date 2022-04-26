import 'package:flutter/material.dart';
import 'package:flutter_navigation_2/screens/MainScreen.dart';

class MainPage extends Page {
  const MainPage();

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => const MainScreen(),
    );
  }
}
