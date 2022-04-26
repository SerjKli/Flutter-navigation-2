/// Represents current app route state
abstract class AppRouteState {
  const AppRouteState();

  String get location;
}

/// State for home page
class HomeAppRouteState extends AppRouteState {
  const HomeAppRouteState();

  @override
  String get location => '/';
}

/// State for item's details page
class ItemDetailRouteState extends AppRouteState {
  final String title;

  const ItemDetailRouteState({
    required this.title,
  });

  @override
  String get location => '/item/${title.toLowerCase()}';
}
