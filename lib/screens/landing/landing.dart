import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';
import 'landing_controller.dart';

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
