import 'package:flutter/material.dart';
import 'package:kkv/common/locator.dart';
import 'package:kkv/router/routes.dart';
import 'package:kkv/services/navigator_service.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("GO to home"),
          onPressed: () {
            locator<NavigationService>().pushNamed(Routes.HOME);
          },
        ),
      ),
    );
  }
}
