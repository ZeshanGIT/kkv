import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingDrawer extends StatelessWidget {
  final Widget child;
  const FloatingDrawer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
      ),
      child: Container(
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 256,
        child: child.paddingAll(24),
      ),
    );
  }
}
