import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final String text;

  const AppLoading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
