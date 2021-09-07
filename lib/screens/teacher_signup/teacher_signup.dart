import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../assets/MyAssets.dart';
import '../../common/constants.dart';
import '../../common/widgets/bottom_width_button.dart';
import '../../common/widgets/top_bar.dart';
import '../../model/user.model.dart';
import 'teacher_signup_controller.dart';

class TeacherSignupPage extends StatelessWidget {
  TeacherSignupPage({Key? key}) : super(key: key);

  final UserModel? _userModel = Get.arguments as UserModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TeacherSigupController>(
          builder: (teacherSignUpController) {
        return Column(
          children: [
            TopBar(),
            SIZED_BOX_32,
            buildTeacherInfo(),
            SIZED_BOX_32,
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
              ),
              initialValue: _userModel?.name,
              readOnly: (_userModel?.name != null || _userModel?.name != ''),
            ).paddingAll(16),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
              initialValue: _userModel?.email,
              readOnly: (_userModel?.email != null || _userModel?.email != ''),
            ).paddingAll(16),
            TextFormField(
              onChanged: teacherSignUpController.onEmpIdChange,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Employee ID",
              ),
            ).paddingAll(16),
            Spacer(),
            BottomWidthBlackButton(
              text: "Get in",
              onPressed: teacherSignUpController.empId != null
                  ? teacherSignUpController.onGetIn
                  : null,
            ),
          ],
        ).paddingAll(16);
      }),
    );
  }

  Widget buildTeacherInfo() {
    return Row(
      children: [
        Text(
          "Teacher info",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        ClipOval(
          child: _userModel?.profilePic == ''
              ? SvgPicture.asset(MyAssets.TeacherDpPlaceholder)
              : Image.network(
                  _userModel?.profilePic ?? '',
                  height: 96,
                ),
        ),
      ],
    ).paddingAll(16);
  }
}
