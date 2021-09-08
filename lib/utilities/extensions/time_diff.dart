import 'package:flutter/material.dart';

extension TimeDiff on TimeOfDay {
  int operator -(TimeOfDay timeOfDay) {
    return (this.hour + this.minute) - (timeOfDay.hour + timeOfDay.minute);
  }
}
