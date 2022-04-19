import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_navigation_2/repositories/main/ItemRepoContract.dart';
import 'package:flutter_navigation_2/repositories/main/ItemRepoFake.dart';
import 'package:flutter_navigation_2/models/ItemModel.dart';
import 'package:flutter_navigation_2/utils/enums/loading_status.dart';

final itemProvider = ChangeNotifierProvider<ItemNotifier>((ref) => ItemNotifier());

class ItemNotifier with ChangeNotifier {
  LoadingStatus _loadingStatus = LoadingStatus.init;
  final ItemRepoContract itemRepo;
  List<ItemModel> _items = [];

  ItemNotifier() : itemRepo = ItemRepoFake() {
    debugPrint("ItemNotifier constructor");
    if (_loadingStatus == LoadingStatus.init) {
      _loadItems();
    }
  }

  bool get isLoading => _loadingStatus == LoadingStatus.loading;
  List<ItemModel> get items => [..._items];

  set loadingStatus(LoadingStatus newStatus) {
    _loadingStatus = newStatus;
    notifyListeners();
  }

  Future<void> _loadItems() async {
    loadingStatus = LoadingStatus.loading;
    _items = [...await itemRepo.loadItems()];
    loadingStatus = LoadingStatus.loaded;
  }
}
