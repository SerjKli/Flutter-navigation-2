import 'package:flutter/material.dart';

import 'package:flutter_navigation_2/screens/InitialScreen.dart';

/// Sample of initial page, shows initial screen
class InitialPage extends Page {
  const InitialPage();

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => const InitialScreen(),
    );
  }
}
