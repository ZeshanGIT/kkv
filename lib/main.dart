import 'package:flutter/material.dart';
import 'package:kkv/common/locator.dart';
import 'package:kkv/router/router.dart';
import 'package:kkv/services/navigator_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouter.routeMap,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
