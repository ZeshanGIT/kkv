import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/constants.dart';

class AttachmentTypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onTap;
  const AttachmentTypeButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black12,
              )),
          child: Column(
            children: [
              SIZED_BOX_8,
              Icon(icon, size: 32),
              SIZED_BOX_8,
              Text(label),
              SIZED_BOX_8,
            ],
          ).paddingAll(16),
        ).paddingAll(16),
      ),
    );
  }
}
