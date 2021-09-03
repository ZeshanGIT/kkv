import 'package:get/get.dart';
import 'package:kkv/router/routes.dart';

class TeacherSigupController extends GetxController {
  String? empId;

  onEmpIdChange(String empId) {
    print("updating $empId");
    this.empId = empId;
    update();
  }

  onGetIn() {
    Get.toNamed(Routes.HOME);
  }
}
