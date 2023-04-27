// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/home/home_news_item.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class HomeNewsScreen extends StatelessWidget {
  static const routeName = 'home-news-screen';
  const HomeNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Thông Tin Đáng Chú Ý',
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
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  HomeNewsItem(
                    title:
                        'Thông báo về việc tổ chức học kỳ hè năm học 2022-2023',
                    text:
                        'Căn cứ kế hoạch học tập năm học 2022-2023, Nhà trường thông báo tổ chức học kỳ hè (đợt 5) năm học 2022-2023 cho các lớp đaiị học chính quy khóa 62 trở về trước. SV xem thông tin cụ thể trong file đính kèm. Trân trọng!',
                    date: '24/04/2023',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
