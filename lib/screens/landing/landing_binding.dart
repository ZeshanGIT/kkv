import 'package:get/get.dart';
import 'package:kkv/screens/landing/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingController());
  }
}
