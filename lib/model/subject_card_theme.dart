import 'package:flutter/rendering.dart';

import '../assets/MyAssets.dart';
import '../common/class_props.dart';

class SubjectCardTheme {
  final Color lightColor;
  final Color darkColor;
  final Color shadowColor;
  final String img;

  factory SubjectCardTheme.fromSubject(String subject) {
    switch (subject) {
      case Subject.SOCIAL_SCIENCE:
      case Subject.HISTORY:
      case Subject.GEOGRAPHY:
      case Subject.POLITICAL_SCIENCE:

      case Subject.MATHEMATICS:
        return VIOLET_THEME;

      case Subject.ENGLISH:
      case Subject.TAMIL:
      case Subject.HINDI:
      case Subject.SANSKRIT:
        return YELLOW_THEME;
      case Subject.EVS:
      case Subject.SCIENCE:
      case Subject.PHYSICS:
      case Subject.CHEMISTRY:
      case Subject.BIOLOGY:
        return GREEN_THEME;

      default:
        return VIOLET_THEME;
    }
  }

  SubjectCardTheme({
    required this.lightColor,
    required this.darkColor,
    required this.shadowColor,
    required this.img,
  });

  // ignore: non_constant_identifier_names
  static final VIOLET_THEME = SubjectCardTheme(
    lightColor: Color(0xFFEDCFEA),
    darkColor: Color(0xFF4F2A74),
    img: MyAssets.Cat,
    shadowColor: Color(0xFFC18ABD).withOpacity(0.3),
  );

  // ignore: non_constant_identifier_names
  static final YELLOW_THEME = SubjectCardTheme(
    lightColor: Color(0xFFFBDBA9),
    darkColor: Color(0xFFF48021),
    shadowColor: Color(0xFFFAB03D).withOpacity(0.3),
    img: MyAssets.Toucan,
  );
  // ignore: non_constant_identifier_names
  static final GREEN_THEME = SubjectCardTheme(
    lightColor: Color(0xFF95C694),
    darkColor: Color(0xFF458E44),
    shadowColor: Color(0xFF458E44).withOpacity(0.3),
    img: MyAssets.Owl,
  );
}
