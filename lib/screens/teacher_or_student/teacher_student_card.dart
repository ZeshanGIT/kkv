import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import '../../common/constants.dart';
import 'teacher_or_student.controller.dart';

class TeacherStudentCard extends StatefulWidget {
  final String title;
  final String desc;
  final Color color;
  final Color onSelectColor;
  final String img;
  final String goTo;
  final String role;

  TeacherStudentCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.color,
    required this.img,
    required this.goTo,
    required this.onSelectColor,
    required this.role,
  }) : super(key: key);

  @override
  _TeacherStudentCardState createState() => _TeacherStudentCardState();
}

class _TeacherStudentCardState extends State<TeacherStudentCard>
    with AnimationMixin {
  late Animation<double> liquidFill;
  late Animation<Color?> color;

  @override
  void initState() {
    liquidFill = (-0.1).tweenTo(1.1).animatedBy(controller);
    color = Colors.black.tweenTo(widget.onSelectColor).animatedBy(controller);
    controller.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherOrStudentController>(
      builder: (TeacherOrStudentController teacherOrStudentController) {
        if (widget.role == teacherOrStudentController.selectedRole) {
          controller.play();
        } else {
          controller.playReverse();
        }
        return GestureDetector(
          onTap: () {
            teacherOrStudentController.setSelectedRole(widget.role);
          },
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: widget.color.withOpacity(0.15),
                      offset: Offset(0, 6),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 128 + 32,
                child: LiquidLinearProgressIndicator(
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 8,
                  value: liquidFill.value,
                  // value: _animation.value.get(AnimProps.liquidFill),
                  valueColor: AlwaysStoppedAnimation(widget.color),
                  backgroundColor: Colors.white,
                  direction: Axis.vertical,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: SvgPicture.asset(
                        widget.img,
                        height: 128,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    SIZED_BOX_16,
                    SizedBox(
                      height: 128,
                      width: 196,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 16,
                              color: color.value,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SIZED_BOX_8,
                          Text(
                            widget.desc,
                            style: TextStyle(
                              fontSize: 12,
                              color: color.value,
                            ),
                          ),
                          Container(
                            height: 42,
                            width: double.maxFinite,
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                color: color.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color lerpedColor(double progress) {
    return Color.lerp(Colors.black, widget.onSelectColor, progress) ??
        Colors.black;
  }
}
