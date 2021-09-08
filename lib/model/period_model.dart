import 'dart:convert';

import 'package:flutter/material.dart';

extension DayFromString on String {
  Day toDay() {
    return Day.values.firstWhere(
      (d) => d.toString().substring(4) == this,
      orElse: () => Day.SelectDay,
    );
  }

  TimeOfDay toTimeOfDay() {
    List<String> tempString = this.split(":");
    return TimeOfDay(
      hour: int.parse(tempString[0]),
      minute: int.parse(tempString[1]),
    );
  }
}

enum Day {
  SelectDay,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
}

class PeriodModel {
  final Day day;
  final TimeOfDay time;

  PeriodModel({
    required this.day,
    required this.time,
  });

  @override
  String toString() => 'ClassModel(day: $day, time: $time)';

  Map<String, dynamic> toMap() {
    return {
      'day': day.toString().substring(4),
      'time': time.toString().substring(10).replaceFirst(")", ""),
    };
  }

  factory PeriodModel.fromMap(Map<String, dynamic> map) {
    return PeriodModel(
      day: map['day'].toString().toDay(),
      time: map['time'].toString().toTimeOfDay(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodModel.fromJson(String source) =>
      PeriodModel.fromMap(json.decode(source));
}
