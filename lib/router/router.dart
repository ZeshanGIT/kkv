import 'package:flutter/material.dart';
import 'package:kkv/router/routes.dart';
import 'package:kkv/screens/get-started/get-started.dart';
import 'package:kkv/screens/home/home_page.dart';
import 'package:kkv/screens/landing/landing_page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routeMap {
    return {
      Routes.GET_STARTED: (_) => GetStarted(),
      Routes.HOME: (_) => HomePage(),
      Routes.LANDING: (_) => LandingPage(),
    };
  }

  static PageRoute onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (_) => GetStarted());
  }
}
