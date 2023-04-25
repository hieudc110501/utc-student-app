// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/home/home_box.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Trang Chủ',
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
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/menu_icon.png',
              color: whiteText,
              scale: 3,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: whiteText,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withAlpha(10),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/icons/avatar.png',
                          scale: 3,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SampleText(
                                text: 'Trương Minh Hiếu',
                                fontWeight: FontWeight.w700,
                                size: 16,
                                color: greyText,
                              ),
                              SampleText(
                                text: 'Mã sinh viên: 191203659',
                                fontWeight: FontWeight.w500,
                                size: 14,
                                color: greyText,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  HomeBox(
                    image: 'assets/icons/home_news.png',
                    text: 'Thông tin chú ý',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HomeBox(
                    image: 'assets/icons/home_calendar.png',
                    text: 'Thời khóa biểu',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  HomeBox(
                    image: 'assets/icons/home_score.png',
                    text: 'Danh sách điểm',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HomeBox(
                    image: 'assets/icons/home_tuition.png',
                    text: 'Tra cứu học phí',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
