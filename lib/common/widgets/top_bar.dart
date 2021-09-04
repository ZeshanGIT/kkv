import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/common/constants.dart';

import '../text_styles.dart';

class TopBar extends StatelessWidget {
  final IconButton? leading;
  final IconButton? trailing;
  final String title;
  const TopBar({
    Key? key,
    this.leading,
    this.trailing,
    this.title = TITLE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading ??
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
              tag: title,
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  title,
                  style: STUDENT_MANAGEMENT_TEXT_STYLE,
                ),
              ),
            ),
          ),
        ),
        //Filler
        trailing ??
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
