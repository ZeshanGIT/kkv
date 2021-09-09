import 'package:get/get.dart';

import 'class_preview_controller.dart';

class ClassPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClassPreviewController());
  }
}
