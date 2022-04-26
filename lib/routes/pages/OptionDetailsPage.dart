import 'package:flutter/material.dart';
import 'package:flutter_navigation_2/screens/OptionDetailsScreen.dart';

class OptionDetailsPage extends Page {
  const OptionDetailsPage();
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => const OptionDetailsScreen(),
    );
  }
}
