import 'package:flutter_navigation_2/models/ItemModel.dart';
import 'package:flutter_navigation_2/repositories/main/ItemRepoContract.dart';
import 'package:flutter_navigation_2/DUMMY.dart';

class ItemRepoFake implements ItemRepoContract {
  @override
  Future<List<ItemModel>> loadItems() async {
    await Future.delayed(const Duration(seconds: 2));
    return DUMMY.map((item) => ItemModel.fromJson(item)).toList();
  }
}
