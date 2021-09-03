import 'package:flutter/material.dart';

import '../screens/get_started/get_started.dart';
import '../screens/teacher_or_student/teacher_or_student.dart';
import 'routes.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routeMap {
    return {
      Routes.GET_STARTED: (_) => GetStartedPage(),
      Routes.TEACHER_OR_STUDENT: (_) => TeacherOrStudentPage(),
    };
  }

  static PageRoute onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (_) => GetStartedPage());
  }
}
