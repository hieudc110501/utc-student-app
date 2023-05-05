// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:utc_student_app/data/models/calendar.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/logic/handle/calender_handle.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_item.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_marker.dart';
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
        listener: (context, state) {},
        builder: (context, state) {
          if (state is StudentStateScheduleSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
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
                            color: rose400,
                          ),
                          rightChevronIcon: const Icon(
                            Icons.keyboard_arrow_right,
                            color: rose400,
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
                            for (Calendar calendar in state.listCalendar) {
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
                                );
                              }
                            }
                            return ScheduleMarker(
                              day: day.day.toString(),
                              isMarker: false,
                              isToday: checkToday(day),
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
                        onDaySelected: (selectedDay, focusedDay) {},
                        availableGestures: AvailableGestures.horizontalSwipe,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const SampleText(
                      text: 'THỜI KHÓA BIỂU CHI TIẾT',
                      fontWeight: FontWeight.w700,
                      size: 16,
                      color: grey700,
                    ),
                    const SizedBox(height: 10),
                    // Container(
                    //   height: 400,
                    //   color: Colors.amber,
                    // ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: state.listCalendar.length,
                        itemBuilder: (context, index) {
                          return ScheduleItem(
                            subject: state.listCalendar[index].subjectName,
                            room: state.listCalendar[index].location ?? 'Trống',
                            begin: state.listCalendar[index].startDay,
                            end: state.listCalendar[index].endDay,
                            lesson: lessonHandle(
                                state.listCalendar[index].lesson ?? -1),
                            weekday:
                                state.listCalendar[index].weekDay.toString(),
                          );
                        },
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
