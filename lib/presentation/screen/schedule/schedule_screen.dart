// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/presentation/widgets/schedule/schedule_item.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: whiteText,
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
                      color: whiteText,
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
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    decoration: BoxDecoration(
                      color: whiteText,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, markedDates) {},
                  ),
                  calendarStyle: const CalendarStyle(
                    rowDecoration: BoxDecoration(
                      color: whiteText,
                    ),
                    todayDecoration: BoxDecoration(
                      color: blue300,
                      shape: BoxShape.circle,
                    ),
                    // selectedDecoration: BoxDecoration(
                    //   color: primaryColorBlue500,
                    //   shape: BoxShape.circle,
                    // ),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {},
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
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ScheduleItem(
                      subject: 'Công nghệ phần mềm',
                      room: '406-A8',
                      begin: '27-4-2023',
                      end: '30-5-2023',
                      lesson: '7,8,9',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
