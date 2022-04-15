import 'package:flutter/material.dart';
import 'package:flutter_navigation_2/screens/MainScreen.dart';

class MainPage extends Page {
  final Function(String) onOptionSelected;

  const MainPage({required this.onOptionSelected});

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => MainScreen(onOptionSelected: onOptionSelected),
    );
  }
}
