
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_navigation_2/routes/router_parser.dart';
import 'package:flutter_navigation_2/routes/router_delegator.dart';

void main() {
  if (kIsWeb) setUrlStrategy(PathUrlStrategy());

  runApp(
    /// Init Riverpod's providers
    /// https://riverpod.dev/docs/concepts/providers#creating-a-provider
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: AppRouteDelegator(ref),
      routeInformationParser: AppRouterInformationParser(),
    );
  }
}
