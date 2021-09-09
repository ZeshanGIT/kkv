import 'package:flutter/material.dart';

import '../../model/period_model.dart';

extension StringExtensions on String {
  int get romanToDeweyDecimal {
    return <String, int>{
          "I": 1,
          "II": 2,
          "III": 3,
          "IV": 4,
          "V": 5,
          "VI": 6,
          "VII": 7,
          "VIII": 8,
          "IX": 9,
          "X": 10,
        }[this] ??
        0;
  }

  Day get toDay {
    return Day.values.firstWhere(
      (d) => d.toString().substring(4) == this,
      orElse: () => Day.SelectDay,
    );
  }

  TimeOfDay get toTimeOfDay {
    List<String> tempString = this.split(":");
    return TimeOfDay(
      hour: int.parse(tempString[0]),
      minute: int.parse(tempString[1]),
    );
  }
}
