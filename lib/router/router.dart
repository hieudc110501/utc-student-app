import 'package:flutter/material.dart';
import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/point.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/models/tuition.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_comment_image.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_create_screen.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_update_screen.dart';
import 'package:utc_student_app/presentation/screen/home/home_news_screen.dart';
import 'package:utc_student_app/presentation/screen/home/home_point_screen.dart';
import 'package:utc_student_app/presentation/screen/login/login_screen.dart';
import 'package:utc_student_app/presentation/screen/main_screen.dart';
import 'package:utc_student_app/presentation/screen/mark/mark_detail_screen.dart';
import 'package:utc_student_app/presentation/screen/tuition/tuition_screen.dart';
import 'package:utc_student_app/presentation/widgets/home/home_news_detail.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_box.dart';

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
    case ProfileBox.routeName:
      final student = settings.arguments as Student;
      return MaterialPageRoute(
        builder: (context) => ProfileBox(student: student),
      );
    case HomeNewsScreen.routeName:
      final news = settings.arguments as List<News>;
      return MaterialPageRoute(
        builder: (context) => HomeNewsScreen(
          news: news,
        ),
      );
    case TuitionScreen.routeName:
      final tuitions = settings.arguments as List<Tuition>;
      return MaterialPageRoute(
        builder: (context) => TuitionScreen(
          tuitions: tuitions,
        ),
      );
    case HomePointScreen.routeName:
      final points = settings.arguments as List<Point>;
      return MaterialPageRoute(
        builder: (context) => HomePointScreen(
          points: points,
        ),
      );
    case HomeNewsDetail.routeName:
      final news = settings.arguments as News;
      return MaterialPageRoute(
        builder: (context) => HomeNewsDetail(
          news: news,
        ),
      );
    case BlogCreateScreen.routeName:
      final student = settings.arguments as Student;
      return MaterialPageRoute(
        builder: (context) => BlogCreateScreen(
          student: student,
        ),
      );
    case BlogCommentImage.routeName:
      final imageUrl = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => BlogCommentImage(
          imageUrl: imageUrl,
        ),
      );
    case BlogUpdateScreen.routeName:
      final blog = settings.arguments as Blog;
      return MaterialPageRoute(
        builder: (context) => BlogUpdateScreen(
          blog: blog,
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
