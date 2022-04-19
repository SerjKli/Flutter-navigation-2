import 'package:flutter/material.dart';
import 'package:flutter_navigation_2/models/ItemModel.dart';
import 'package:flutter_navigation_2/providers/MainProvider.dart';
import 'package:flutter_navigation_2/widgets/loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends StatelessWidget {
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
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, _) {
            final ItemNotifier _itemProvider = ref.watch(itemProvider);

            if (_itemProvider.isLoading) return const AppLoading(text: "items loading");

            final List<ItemModel> _items = _itemProvider.items;

            return GridView.count(
              crossAxisCount: 2,
              children: [
                ..._items
                    .map((option) => _OptionWidget(
                          title: option.title,
                          onOptionSelected: onOptionSelected,
                        ))
                    .toList(),
              ],
            );
          },
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
