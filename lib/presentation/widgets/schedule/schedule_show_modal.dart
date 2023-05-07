// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/data/models/calendar.dart';
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/logic/handle/calender_handle.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';

class ScheduleShowModal extends StatelessWidget {
  final DateTime day;
  final List<Calendar> listSelected;
  final List<Exam> listExam;
  const ScheduleShowModal({
    Key? key,
    required this.day,
    required this.listSelected,
    required this.listExam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String weekday = weekdayNumber(day.weekday);
    return SizedBox(
      height: screenSize.height * 0.64,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              height: screenSize.height * 0.1,
              width: screenSize.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    blue300.withOpacity(0.7),
                    blue300.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: whiteText,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
              ),
              width: screenSize.width,
              height: screenSize.height * 0.60,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: weekday,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: rose700,
                      ),
                      children: [
                        const TextSpan(
                          text: ', ngày',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: grey700,
                          ),
                        ),
                        TextSpan(
                          text: ' ${day.day}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: rose700,
                          ),
                        ),
                        const TextSpan(
                          text: ' tháng',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: grey700,
                          ),
                        ),
                        TextSpan(
                          text: ' ${day.month}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: rose700,
                          ),
                        ),
                        const TextSpan(
                          text: ' năm',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: grey700,
                          ),
                        ),
                        TextSpan(
                          text: ' ${day.year}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: rose700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  listSelected.isEmpty && listExam.isEmpty
                      ? SizedBox(
                          width: screenSize.width,
                          height: screenSize.height * 0.5,
                          child: const Center(
                            child: SampleText(
                              text: 'Không có lịch',
                              fontWeight: FontWeight.w700,
                              size: 16,
                              color: grey400,
                            ),
                          ),
                        )
                      : listSelected.isEmpty ? SizedBox(
                          width: screenSize.width,
                          height: screenSize.height * 0.5,
                          child: ListView.builder(
                            itemCount: listExam.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  children: [
                                    Container(
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                        color: rose25,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: rose700,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SampleText(
                                              text: listExam[index]
                                                  .moduleName,
                                              fontWeight: FontWeight.w700,
                                              size: 18,
                                              color: indigo700,
                                            ),
                                            SampleText(
                                              text: listExam[index]
                                                  .room
                                                  .toString()
                                                  .trim(),
                                              fontWeight: FontWeight.w700,
                                              size: 16,
                                              color: rose700,
                                            ),
                                            SampleText(
                                              text: listExam[index].lesson,
                                              fontWeight: FontWeight.w700,
                                              size: 16,
                                              color: grey700,
                                            ),
                                            SampleText(
                                              text: listExam[index].type,
                                              fontWeight: FontWeight.w700,
                                              size: 16,
                                              color: grey700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              );
                            },
                          ),
                        ) : SizedBox(
                          width: screenSize.width,
                          height: screenSize.height * 0.5,
                          child: ListView.builder(
                            itemCount: listSelected.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  children: [
                                    Container(
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                        color: blue25,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: indigo700,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SampleText(
                                              text: listSelected[index]
                                                  .subjectName,
                                              fontWeight: FontWeight.w700,
                                              size: 18,
                                              color: indigo700,
                                            ),
                                            SampleText(
                                              text: listSelected[index]
                                                  .location
                                                  .toString()
                                                  .trim(),
                                              fontWeight: FontWeight.w700,
                                              size: 16,
                                              color: rose700,
                                            ),
                                            SampleText(
                                              text:
                                                  'Tiết ${lessonHandle(listSelected[index].lesson ?? -1)}',
                                              fontWeight: FontWeight.w700,
                                              size: 16,
                                              color: grey700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
