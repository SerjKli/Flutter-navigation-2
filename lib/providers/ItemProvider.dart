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
  String? _selectedTitle;

  ItemNotifier() : itemRepo = ItemRepoFake() {
    if (_loadingStatus == LoadingStatus.init) {
      _loadItems();
    }
  }

  ItemModel? get selectedItem {
    if(_selectedTitle == null || _items.isEmpty) return null;
    final List<ItemModel> _item = _items.where((element) => element.title.toLowerCase() ==
    _selectedTitle!.toLowerCase()).toList();
    if(_items.isEmpty) return null;
    return _item.first;
  }

  bool get isLoading => _loadingStatus == LoadingStatus.loading;
  List<ItemModel> get items => [..._items];

  set loadingStatus(LoadingStatus newStatus) {
    _loadingStatus = newStatus;
    notifyListeners();
  }

  set selectedTitle(String? title){
    _selectedTitle = title;
    notifyListeners();
  }

  Future<void> _loadItems() async {
    loadingStatus = LoadingStatus.loading;
    _items = [...await itemRepo.loadItems()];
    loadingStatus = LoadingStatus.loaded;
  }
}
