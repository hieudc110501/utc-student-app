// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';

class HomeNewsDetail extends StatelessWidget {
  static const routeName = 'home-news-detail';
  final News news;
  const HomeNewsDetail({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Chi Tiết',
            fontWeight: FontWeight.w600,
            size: 18,
            color: whiteText,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: indigo900,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: whiteText,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                SampleText(
                  text: news.title,
                  fontWeight: FontWeight.w700,
                  size: 20,
                  color: grey700,
                ),
                const Divider(),
                SampleText(
                  text: 'Ngày ${news.date}',
                  fontWeight: FontWeight.w600,
                  size: 14,
                  color: blue600,
                ),
                const SizedBox(height: 20),
                SampleText(
                  text: news.content,
                  fontWeight: FontWeight.w500,
                  size: 16,
                  color: grey700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
