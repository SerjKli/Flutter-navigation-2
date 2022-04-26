import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_navigation_2/models/ItemModel.dart';
import 'package:flutter_navigation_2/providers/ItemProvider.dart';
import 'package:flutter_navigation_2/widgets/loading.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
              crossAxisCount: 4,
              children: [
                ..._items
                    .map((option) => _OptionWidget(
                          title: option.title,
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
  const _OptionWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        child: Consumer(
          builder: (ctx, ref, child) {
            final _itemProvider = ref.read(itemProvider);
            return InkWell(
              onTap: () {
                _itemProvider.selectedTitle = title;
              },
              child: child,
            );
          },
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
