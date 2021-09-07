import 'package:flutter/material.dart';
import 'package:kkv/common/widgets/top_bar.dart';

class AddTimetable extends StatelessWidget {
  const AddTimetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopBar(
        title: "Add Timetable",
        leadingIcon: Icons.close_rounded,
      ),
    );
  }
}
