// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class ScheduleItem extends StatelessWidget {
  final String subject;
  final String room;
  final String begin;
  final String end;
  final String lesson;
  final String weekday;
  const ScheduleItem({
    Key? key,
    required this.subject,
    required this.room,
    required this.begin,
    required this.end,
    required this.lesson,
    required this.weekday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SampleText(
                    text: subject,
                    fontWeight: FontWeight.w700,
                    size: 16,
                    color: indigo900,
                  ),
                  SampleText(
                    text: 'Từ $begin đến $end',
                    fontWeight: FontWeight.w600,
                    size: 16,
                    color: rose700,
                  ),
                  SampleText(
                    text: room.trim(),
                    fontWeight: FontWeight.w500,
                    size: 16,
                    color: grey700,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SampleText(
                    text: 'Tiết: $lesson',
                    fontWeight: FontWeight.w500,
                    size: 16,
                    color: grey700,
                  ),
                  SampleText(
                    text: 'Thứ: $weekday',
                    fontWeight: FontWeight.w500,
                    size: 16,
                    color: grey700,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
