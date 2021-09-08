import 'package:flutter/material.dart';

enum Day {
  SelectDay,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
}

class ClassModel {
  final Day day;
  final TimeOfDay time;

  ClassModel({
    required this.day,
    required this.time,
  });

  @override
  String toString() => 'ClassModel(day: $day, time: $time)';
}
