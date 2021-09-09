import 'package:get/get.dart';
import 'package:kkv/screens/teacher/classroom/classroom_controller.dart';

class ClassroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClassroomController());
  }
}
