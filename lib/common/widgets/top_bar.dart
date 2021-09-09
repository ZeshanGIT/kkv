import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/extensions/text_hero_transparent.dart';
import '../constants.dart';
import '../text_styles.dart';

class TopBar extends StatelessWidget {
  final IconData? leadingIcon;
  final Function()? leadingAction;
  final IconData? trailingIcon;
  final Function()? trailingAction;
  final String title;

  TopBar({
    Key? key,
    this.leadingIcon,
    this.trailingIcon,
    this.title = TITLE,
    this.leadingAction,
    this.trailingAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: leadingAction ?? Get.back,
          icon: Icon(leadingIcon ?? Icons.chevron_left_rounded),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: HEADING_TEXT_STYLE,
            ).hero(title),
          ),
        ),
        //Filler
        Opacity(
          opacity: trailingIcon != null ? 1 : 0,
          child: IconButton(
            onPressed: trailingAction,
            icon: Icon(
              trailingIcon,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }
}
