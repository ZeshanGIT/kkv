import 'package:get/get.dart';

import 'classroom_controller.dart';

class ClassroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClassroomController());
  }
}
