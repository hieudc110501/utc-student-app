// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/data/enum/blog_page.dart';
import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/repositories/blog/blog_repository.dart';
import 'package:utc_student_app/presentation/screen/blog/blog_item_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class BlogSearchDelegate extends SearchDelegate {
  final BlogRepository _blogRepository = BlogRepository();
  final Student currentStudent;
  BlogSearchDelegate({
    required this.currentStudent,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    _blogRepository.getBlogSearch(
        studentId: currentStudent.studentId, content: query);

    return StreamBuilder(
      stream: _blogRepository.all(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCircleScreen();
        }
        if (snapshot.hasData) {
          List<Blog> blogs = snapshot.data!;
          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  BlogItemScreen(
                    blog: blogs[index],
                    currentStudent: currentStudent,
                    blogPage: BlogPage.public,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          );
        }
        return const Center(
          child: SampleText(
            text: 'Chưa có bài viết nào',
            fontWeight: FontWeight.w600,
            size: 20,
            color: greyText,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _blogRepository.getBlogSearch(
        studentId: currentStudent.studentId, content: query);
    return StreamBuilder(
      stream: _blogRepository.all(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCircleScreen();
        }
        if (snapshot.hasData) {
          List<Blog> blogs = snapshot.data!;

          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  BlogItemScreen(
                    blog: blogs[index],
                    currentStudent: currentStudent,
                    blogPage: BlogPage.public,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          );
        }
        return const Center(
          child: SampleText(
            text: 'Chưa có bài viết nào',
            fontWeight: FontWeight.w600,
            size: 20,
            color: greyText,
          ),
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: indigo900,
        elevation: 3,
        shadowColor: whiteText,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: whiteText,
        ),
      ),
      textTheme: const TextTheme(
        // Use this to change the query's text style
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
