import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_2/providers/ItemProvider.dart';
import 'package:flutter_navigation_2/routes/pages/InitialPage.dart';
import 'package:flutter_navigation_2/routes/pages/MainPage.dart';
import 'package:flutter_navigation_2/routes/pages/OptionDetailsPage.dart';
import 'package:flutter_navigation_2/routes/router_states.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// App router delegator
/// Build Navigator according the app state and handling the pop requests
class AppRouteDelegator extends RouterDelegate<AppRouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteState> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final WidgetRef ref;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// Determinate if the app is ready to use
  bool _isInit = false;

  AppRouteDelegator(this.ref) {
    _initApp();
  }

  String? get selectedItemTitle => ref.watch(itemProvider).selectedItem?.title;

  /// Emulate getting data from the remote API or local storage
  ///
  /// For example, You can use this method to check the authentication status
  Future<void> _initApp() async {
    if (_isInit) return;

    /// Random delay
    await Future.delayed(const Duration(milliseconds: 300));

    _isInit = true;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      /// pages stack, shows the last page in this stack
      pages: [
        const MainPage(),
        if (!_isInit) const InitialPage(),
        if (selectedItemTitle != null) const OptionDetailsPage(),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  AppRouteState get currentConfiguration {
    if (selectedItemTitle != null) {
      return ItemDetailRouteState(title: selectedItemTitle!);
    } else {
      return const HomeAppRouteState();
    }
  }

  /// For example this method can be used to check access to pages (guards)
  @override
  Future<void> setNewRoutePath(AppRouteState configuration) async {
    final _itemProvider = ref.watch(itemProvider);

    if (configuration is ItemDetailRouteState) {
      _itemProvider.selectedTitle = configuration.title;
    } else {
      _itemProvider.selectedTitle = null;
    }
  }
}
