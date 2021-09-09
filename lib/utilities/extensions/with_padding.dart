import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension WithPadding on List<Widget> {
  List<Widget> withSymmetricPadding([double? padding]) {
    return this
        .map((w) => w.paddingSymmetric(horizontal: padding ?? 16))
        .toList();
  }
}
