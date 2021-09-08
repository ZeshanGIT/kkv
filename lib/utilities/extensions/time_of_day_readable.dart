import 'package:flutter/material.dart';

extension TimeOfDayReadable on TimeOfDay? {
  String? toReadableString() {
    if (this == null) return null;
    return "${this!.hourOfPeriod} : ${this!.minute.toString().padLeft(2, '0')} ${this!.period.toString().split('.')[1].toUpperCase()}";
  }
}
