import 'package:flutter/material.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/presentation/screen/home/home_news_screen.dart';
import 'package:utc_student_app/presentation/screen/login/login_screen.dart';
import 'package:utc_student_app/presentation/screen/main_screen.dart';
import 'package:utc_student_app/presentation/screen/mark/mark_detail_screen.dart';

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
    case MarkDetailScreen.routeName:
      final marks = settings.arguments as List<Mark>;
      return MaterialPageRoute(
        builder: (context) => MarkDetailScreen(marks: marks),
      );
    case HomeNewsScreen.routeName:
      final news = settings.arguments as List<News>;
      return MaterialPageRoute(
        builder: (context) => HomeNewsScreen(
          news: news,
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
