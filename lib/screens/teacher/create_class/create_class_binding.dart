import 'package:get/get.dart';

import 'create_class_controller.dart';

class CreateClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateClassController());
  }
}
