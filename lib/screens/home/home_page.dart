import 'package:flutter/material.dart';
import 'package:kkv/common/locator.dart';
import 'package:kkv/services/navigator_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("GO to landing"),
          onPressed: () {
            locator<NavigationService>().goBack();
          },
        ),
      ),
    );
  }
}
