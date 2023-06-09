// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:utc_student_app/data/models/schedule.dart';
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/logic/handle/calender_handle.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_dialog.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_exam_item.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_item.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_marker.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_show_modal.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Thời Khóa Biểu',
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
            icon: Image.asset(
              Asset.icon('note.png'),
              scale: 3,
              color: whiteText,
            ),
            onPressed: () => scheduleDialog(context),
          ),
        ],
      ),
      body: BlocConsumer<StudentBloc, StudentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is StudentStateScheduleSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: blue100,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TableCalendar(
                        rowHeight: 60,
                        locale: 'vi',
                        calendarFormat: CalendarFormat.month,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        focusedDay: DateTime.now(),
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.utc(2028, 3, 14),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          decoration: const BoxDecoration(
                            color: blue100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                            ),
                          ),
                          leftChevronIcon: const Icon(
                            Icons.keyboard_arrow_left,
                            color: indigo900,
                          ),
                          rightChevronIcon: const Icon(
                            Icons.keyboard_arrow_right,
                            color: indigo900,
                          ),
                          rightChevronPadding: const EdgeInsets.only(right: 50),
                          leftChevronPadding: const EdgeInsets.only(left: 50),
                          titleTextStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ).copyWith(color: grey700),
                        ),
                        daysOfWeekStyle: DaysOfWeekStyle(
                          dowTextFormatter: (date, locale) {
                            return convertWeekDay(date.weekday);
                          },
                          decoration: const BoxDecoration(
                            color: blue100,
                          ),
                          weekdayStyle: const TextStyle(
                            //fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: grey700,
                            fontSize: 14,
                          ),
                          weekendStyle: const TextStyle(
                            //fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: grey700,
                            fontSize: 14,
                          ),
                        ),
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, day, markedDates) {
                            for (Schedule calendar in state.listCalendar) {
                              if (markerCheck(
                                calendar.startDay,
                                calendar.endDay,
                                day,
                                calendar.weekDay ?? -1,
                              )) {
                                return ScheduleMarker(
                                  day: day.day.toString(),
                                  isMarker: true,
                                  isToday: checkToday(day),
                                  isExam: false,
                                );
                              }
                            }
                            for (Exam exam in state.listExam) {
                              if (checkSameDay(
                                  DateTime.parse(exam.date), day)) {
                                return ScheduleMarker(
                                  day: day.day.toString(),
                                  isMarker: true,
                                  isToday: checkToday(day),
                                  isExam: true,
                                );
                              }
                            }
                            return ScheduleMarker(
                              day: day.day.toString(),
                              isMarker: false,
                              isToday: checkToday(day),
                              isExam: false,
                            );
                          },
                        ),
                        calendarStyle: const CalendarStyle(
                          rowDecoration: BoxDecoration(
                            color: blue100,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          // selectedDecoration: BoxDecoration(
                          //   color: primaryColorBlue500,
                          //   shape: BoxShape.circle,
                          // ),
                        ),
                        onDaySelected: (selectedDay, focusedDay) {
                          showModalBottomSheet(
                            backgroundColor: Colors.white.withOpacity(0),
                            barrierColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(26),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              List<Schedule> listSelected = [];
                              List<Exam> listExam = [];
                              for (Schedule calendar in state.listCalendar) {
                                if (markerCheck(
                                  calendar.startDay,
                                  calendar.endDay,
                                  selectedDay,
                                  calendar.weekDay ?? -1,
                                )) {
                                  listSelected.add(calendar);
                                }
                              }
                              for (Exam exam in state.listExam) {
                                if (checkSameDay(
                                    DateTime.parse(exam.date), selectedDay)) {
                                  listExam.add(exam);
                                }
                              }
                              return ScheduleShowModal(
                                day: selectedDay,
                                listSelected: listSelected,
                                listExam: listExam,
                              );
                            },
                            isScrollControlled: true,
                          );
                        },
                        availableGestures: AvailableGestures.horizontalSwipe,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const SampleText(
                      text: 'THỜI KHÓA BIỂU LỊCH HỌC',
                      fontWeight: FontWeight.w700,
                      size: 16,
                      color: indigo700,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: indigo700,
                        ),
                      ),
                      height: 200,
                      child: state.listCalendar.isEmpty
                          ? const Center(
                              child: SampleText(
                                text: 'Không có lịch',
                                fontWeight: FontWeight.w600,
                                size: 16,
                                color: grey500,
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.listCalendar.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ScheduleItem(
                                    index: index + 1,
                                    subject:
                                        state.listCalendar[index].moduleName,
                                    room: state.listCalendar[index].location ??
                                        'Trống',
                                    begin: state.listCalendar[index].startDay,
                                    end: state.listCalendar[index].endDay,
                                    lesson: lessonHandle(
                                        state.listCalendar[index].lesson ?? -1),
                                    weekday:
                                        (state.listCalendar[index].weekDay ??
                                                'Trống')
                                            .toString(),
                                  ),
                                );
                              },
                              physics: const BouncingScrollPhysics(),
                            ),
                    ),
                    const SizedBox(height: 30),
                    const SampleText(
                      text: 'THỜI KHÓA BIỂU LỊCH THI',
                      fontWeight: FontWeight.w700,
                      size: 16,
                      color: rose700,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: rose700,
                        ),
                      ),
                      height: 200,
                      child: state.listExam.isEmpty
                          ? const Center(
                              child: SampleText(
                                text: 'Không có lịch',
                                fontWeight: FontWeight.w600,
                                size: 16,
                                color: grey500,
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.listExam.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ScheduleExamItem(
                                    index: index + 1,
                                    subject: state.listExam[index].moduleName,
                                    room: state.listExam[index].room,
                                    date: state.listExam[index].date,
                                    type: state.listExam[index].type,
                                    lesson: state.listExam[index].lesson,
                                    identity: state.listExam[index].identify
                                        .toString(),
                                  ),
                                );
                              },
                              physics: const BouncingScrollPhysics(),
                            ),
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
