import 'package:flutter/material.dart';
import 'package:flutter_navigation_2/routes/router_states.dart';

/// Parses the current location after that RouterDelegate changing the app state
///
/// If you are going to build only mobile app (without Web app) it's not necessary to build it
class AppRouterInformationParser extends RouteInformationParser<AppRouteState> {
  /// Convert current url to navigation state
  @override
  Future<AppRouteState> parseRouteInformation(RouteInformation routeInformation) async {
    final Uri uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'item') {
      return ItemDetailRouteState(title: uri.pathSegments[1]);
    }

    return const HomeAppRouteState();
  }

  /// Convert current navigation state to url
  @override
  RouteInformation restoreRouteInformation(AppRouteState state) {
    return RouteInformation(location: state.location);
  }
}
