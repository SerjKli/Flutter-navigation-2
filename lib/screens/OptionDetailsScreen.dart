import 'package:flutter/material.dart';

class OptionDetailsScreen extends StatelessWidget {
  final String option;
  const OptionDetailsScreen({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's talk about $option"),
      ),
      body: const Center(
        child: Text('More details here'),
      ),
    );
  }
}
