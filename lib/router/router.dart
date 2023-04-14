import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/screen/error/error_screen.dart';
import 'package:utc_student_app/presentation/screen/login/login_screen.dart';
import 'package:utc_student_app/presentation/screen/main_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const MainScreen(),
      );
    case ErrorScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ErrorScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: LoginScreen(),
        ),
      );
  }
}
