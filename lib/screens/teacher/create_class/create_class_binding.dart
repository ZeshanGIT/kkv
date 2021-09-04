import 'package:get/get.dart';
import 'package:kkv/screens/teacher/create_class/create_class_controller.dart';

class CreateClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateClassController());
  }
}
