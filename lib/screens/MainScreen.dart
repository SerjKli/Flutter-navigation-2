import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final List<String> _options = const [
    "Apple",
    "Banana",
    "Orange",
    "Peach",
  ];
  final Function(String) onOptionSelected;

  const MainScreen({
    Key? key,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main screen"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ..._options
                .map((option) => _OptionWidget(
                      title: option,
                      onOptionSelected: onOptionSelected,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class _OptionWidget extends StatelessWidget {
  final String title;
  final Function onOptionSelected;
  const _OptionWidget({
    Key? key,
    required this.title,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            onOptionSelected(title);
          },
          child: Center(
            child: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
