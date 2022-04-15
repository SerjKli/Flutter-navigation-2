import 'package:flutter/material.dart';
import 'package:flutter_navigation_2/screens/OptionDetailsScreen.dart';

class OptionDetailsPage extends Page {
  final String option;
  const OptionDetailsPage({required this.option});
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => OptionDetailsScreen(option: option),
    );
  }
}
