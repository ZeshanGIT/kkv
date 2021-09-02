import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomWidthBlackButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  BottomWidthBlackButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: Color(0xFF131529),
        fixedSize: Size(Get.width, 48),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
