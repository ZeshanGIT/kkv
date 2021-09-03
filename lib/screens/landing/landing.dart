import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/screens/landing/landing_controller.dart';
import 'package:kkv/services/auth_service.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingController>(
      builder: (landingController) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Text("Landing"),
                ElevatedButton(
                  onPressed: MyAuth.logout,
                  child: Text("Logout"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
