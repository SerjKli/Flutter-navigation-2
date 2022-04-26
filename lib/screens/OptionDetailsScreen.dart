import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_navigation_2/models/ItemModel.dart';
import 'package:flutter_navigation_2/providers/ItemProvider.dart';

class OptionDetailsScreen extends StatelessWidget {
  const OptionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        final ItemModel _item = ref.read(itemProvider).selectedItem!;

        return Scaffold(
          appBar: AppBar(
            title: Text("Let's talk about ${_item.title}"),
          ),
          body: Center(
            child: Text(_item.caption),
          ),
        );
      },
    );
  }
}
