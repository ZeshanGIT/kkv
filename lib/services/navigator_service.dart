import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }

  Future<dynamic> popAndPushName(String routeName, {dynamic args}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: args);
  }

  void popUntil(String routeName) {
    navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  Future<dynamic> popUntilAndNavigateTo(
      {required String popUntil, required String navigateTo, dynamic args}) {
    this.popUntil(popUntil);
    return this.pushNamed(navigateTo);
  }
}
