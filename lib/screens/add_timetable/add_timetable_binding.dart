import 'package:get/get.dart';

import 'add_timetable_controller.dart';
import 'widgets/add_class_controller.dart';

class AddTimetableBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTimetableController());
    Get.put(AddClassController());
  }
}
