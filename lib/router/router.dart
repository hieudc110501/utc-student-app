import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/screen/login/login_screen.dart';
import 'package:utc_student_app/presentation/screen/main_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainScreen.routeName:
      final username = settings.arguments as String;
      final password = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => MainScreen(
          username: username,
          password: password,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: LoginScreen(),
        ),
      );
  }
}
