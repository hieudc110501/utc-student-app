// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/screen/home/home_news_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_screen.dart';
import 'package:utc_student_app/presentation/widgets/home/home_box.dart';
import 'package:utc_student_app/presentation/widgets/home/home_news_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

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
      body: BlocConsumer<StudentBloc, StudentState>(
        listener: (context, state) {
          if (state.isLoading) {
            LoadingScreen.instance().show(context: context, text: '');
          } else {
            LoadingScreen.instance().hide();
          }
        },
        builder: (context, state) {
          if (state is StudentStateInfoSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: whiteText,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                                  children: [
                                    SampleText(
                                      text: state.student.studentName,
                                      fontWeight: FontWeight.w700,
                                      size: 16,
                                      color: greyText,
                                    ),
                                    SampleText(
                                      text:
                                          'Mã sinh viên: ${state.student.studentId}',
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
                    const SizedBox(height: 30),
                    const SampleText(
                      text: 'DANH MỤC CHÍNH',
                      fontWeight: FontWeight.w700,
                      size: 16,
                      color: grey700,
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
                    const SizedBox(height: 30),
                    SampleText(
                      text:
                          'LỊCH HÔM NAY (${DateFormat('yyyy-MM-dd').format(DateTime.now())})',
                      fontWeight: FontWeight.w700,
                      size: 16,
                      color: grey700,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: whiteText,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withAlpha(10),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: SampleText(
                          text: 'Ngày hôm nay không có lịch nào',
                          fontWeight: FontWeight.w400,
                          size: 14,
                          color: grey500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SampleText(
                          text: 'THÔNG TIN ĐÁNG CHÚ Ý',
                          fontWeight: FontWeight.w700,
                          size: 16,
                          color: grey700,
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            HomeNewsScreen.routeName,
                            arguments: state.news,
                          ),
                          child: const SampleText(
                            text: 'Xem thêm',
                            fontWeight: FontWeight.w600,
                            size: 14,
                            color: grey500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    HomeNewsItem(
                      title: state.news.first.title,
                      text: state.news.first.content,
                      date: state.news.first.date,
                    ),
                  ],
                ),
              ),
            );
          }
          return const LoadingCircleScreen();
        },
      ),
    );
  }
}
