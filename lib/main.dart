import 'package:flutter/material.dart';
import 'package:flutter_navigation_2/DUMMY.dart';
import 'package:flutter_navigation_2/models/ItemModel.dart';
import 'package:flutter_navigation_2/routes/router_delegator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    /// Init Riverpod's providers
    /// https://riverpod.dev/docs/concepts/providers#creating-a-provider
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Router(routerDelegate: AppRouteDelegator()),
    );
  }
}
