import 'package:flutter/material.dart';
import 'package:utc_student_app/screen/login/login_screen.dart';
import 'package:utc_student_app/screen/main_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const MainScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: LoginScreen(),
        ),
      );
  }
}
