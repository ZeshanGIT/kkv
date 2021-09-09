import 'package:get/get.dart';

import 'add_assignment_controller.dart';

class AddAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddAssignmentController());
  }
}
