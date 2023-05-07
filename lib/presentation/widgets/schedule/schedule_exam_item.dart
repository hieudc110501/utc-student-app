// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class ScheduleExamItem extends StatelessWidget {
  final int index;
  final String subject;
  final String room;
  final String date;
  final String type;
  final String lesson;
  final String identity;
  const ScheduleExamItem({
    Key? key,
    required this.index,
    required this.subject,
    required this.room,
    required this.date,
    required this.type,
    required this.lesson,
    required this.identity,
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
                    text: '$index. $subject',
                    fontWeight: FontWeight.w700,
                    size: 16,
                    color: indigo900,
                  ),
                  SampleText(
                    text: 'Ngày $date',
                    fontWeight: FontWeight.w600,
                    size: 16,
                    color: rose700,
                  ),
                  SampleText(
                    text: lesson,
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
                    text: 'SBD: $identity',
                    fontWeight: FontWeight.w500,
                    size: 16,
                    color: grey700,
                  ),
                  SampleText(
                    text: type,
                    fontWeight: FontWeight.w500,
                    size: 16,
                    color: grey700,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: grey900,
        ),
      ],
    );
  }
}
