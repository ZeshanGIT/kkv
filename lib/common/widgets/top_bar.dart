import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_styles.dart';

class TopBar extends StatelessWidget {
  final IconButton? leftIconButton;
  final IconButton? rightIconButton;
  const TopBar({
    Key? key,
    this.leftIconButton,
    this.rightIconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leftIconButton ??
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.chevron_left_rounded,
                size: 32,
              ),
            ),
        Expanded(
          child: Center(
            child: Hero(
              tag: "student-management",
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  "Student Management",
                  style: STUDENT_MANAGEMENT_TEXT_STYLE,
                ),
              ),
            ),
          ),
        ),
        //Filler
        rightIconButton ??
            Opacity(
              opacity: 0,
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  size: 32,
                ),
              ),
            ),
      ],
    );
  }
}
