// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/logic/handle/calender_handle.dart';
import 'package:utc_student_app/presentation/screen/home/home_news_screen.dart';
import 'package:utc_student_app/presentation/screen/home/home_point_screen.dart';
import 'package:utc_student_app/presentation/screen/home/home_student_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_screen.dart';
import 'package:utc_student_app/presentation/screen/tuition/tuition_screen.dart';
import 'package:utc_student_app/presentation/widgets/home/home_box.dart';
import 'package:utc_student_app/presentation/widgets/home/home_news_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_exam_item.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_item.dart';
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
            LoadingScreen().show(context: context, text: '');
          } else {
            LoadingScreen().hide();
          }
        },
        builder: (context, state) {
          if (state is StudentStateInfoSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
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
                        child: HomeStudentScreen(
                          student: state.student,
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
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              HomeNewsScreen.routeName,
                              arguments: state.news,
                            ),
                            child: const HomeBox(
                              image: 'assets/icons/home_news.png',
                              text: 'Thông tin chú ý',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const HomeBox(
                              image: 'assets/icons/home_calendar.png',
                              text: 'Tra cứu lịch thi',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              HomePointScreen.routeName,
                              arguments: state.points,
                            ),
                            child: const HomeBox(
                              image: 'assets/icons/home_score.png',
                              text: 'Điểm rèn luyện',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              TuitionScreen.routeName,
                              arguments: state.tuitions,
                            ),
                            child: const HomeBox(
                              image: 'assets/icons/home_tuition.png',
                              text: 'Tra cứu học phí',
                            ),
                          ),
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
                      child: Center(
                        child: checkSchedule(state.schedules).isEmpty
                            ? checkExam(state.exams).isEmpty
                                ? const SampleText(
                                    text: 'Ngày hôm nay không có lịch nào',
                                    fontWeight: FontWeight.w400,
                                    size: 14,
                                    color: grey500,
                                  )
                                : ListView.builder(
                                    itemCount: checkExam(state.exams).length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ScheduleExamItem(
                                          index: index + 1,
                                          subject: checkExam(state.exams)[index]
                                              .moduleName,
                                          room: checkExam(state.exams)[index]
                                              .room,
                                          date: checkExam(state.exams)[index]
                                              .date,
                                          type: checkExam(state.exams)[index]
                                              .type,
                                          lesson: checkExam(state.exams)[index]
                                              .lesson,
                                          identity: state.exams[index].identify
                                              .toString(),
                                        ),
                                      );
                                    },
                                    physics: const BouncingScrollPhysics(),
                                  )
                            : ListView.builder(
                                itemCount:
                                    checkSchedule(state.schedules).length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ScheduleItem(
                                      index: index + 1,
                                      subject:
                                          checkSchedule(state.schedules)[index]
                                              .moduleName,
                                      room:
                                          checkSchedule(state.schedules)[index]
                                                  .location ??
                                              'Trống',
                                      begin:
                                          checkSchedule(state.schedules)[index]
                                              .startDay,
                                      end: checkSchedule(state.schedules)[index]
                                          .endDay,
                                      lesson: lessonHandle(
                                          checkSchedule(state.schedules)[index]
                                                  .lesson ??
                                              -1),
                                      weekday:
                                          (checkSchedule(state.schedules)[index]
                                                      .weekDay ??
                                                  'Trống')
                                              .toString(),
                                    ),
                                  );
                                },
                                physics: const BouncingScrollPhysics(),
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
                      news: state.news.first,
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
