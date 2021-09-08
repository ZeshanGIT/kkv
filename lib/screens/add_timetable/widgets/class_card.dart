import 'package:flutter/material.dart';
import 'package:kkv/model/class_model.dart';

class ClassCard extends StatelessWidget {
  final ClassModel classModel;
  const ClassCard(this.classModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(classModel);
    return Container();
  }
}
