import 'package:flutter_navigation_2/models/ItemModel.dart';

abstract class ItemRepoContract {
  /// Load all items
  Future<List<ItemModel>> loadItems();
}
