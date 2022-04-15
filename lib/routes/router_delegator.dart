import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_2/routes/pages/InitialPage.dart';
import 'package:flutter_navigation_2/routes/pages/MainPage.dart';
import 'package:flutter_navigation_2/routes/pages/OptionDetailsPage.dart';

/// App router delegator
/// Handle all route's activities
class AppRouteDelegator extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  /// Determinate if app is ready to use
  bool _isInit = false;
  String? _selectedOption;

  AppRouteDelegator() {
    _initApp();
  }

  /// Emulate getting data from remote API or local storage
  Future<void> _initApp() async {
    await Future.delayed(const Duration(milliseconds: 300));

    /// Random delay
    _isInit = true;
    notifyListeners();
  }

  String? get selectedOption => _selectedOption;
  set selectedOption(String? value) {
    _selectedOption = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MainPage(
          onOptionSelected: (String newSelectedOption) {
            debugPrint("selected option = $newSelectedOption");
            selectedOption = newSelectedOption;
          },
        ),
        if (!_isInit) const InitialPage(),
        if (_selectedOption != null) OptionDetailsPage(option: selectedOption!),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    debugPrint("$configuration");
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
