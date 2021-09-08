import 'package:get/get.dart';
import 'package:flutter/material.dart';

extension WithPadding on List<Widget> {
  List<Widget> withSymmetricPadding(double padding) {
    return this.map((w) => w.paddingSymmetric(horizontal: padding)).toList();
  }
}
