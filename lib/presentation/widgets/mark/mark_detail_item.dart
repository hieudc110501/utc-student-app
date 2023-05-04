// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/presentation/widgets/mark/mark_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class MarkDetailItem extends StatelessWidget {
  final String title;
  final int size;
  final List<Mark> marks;
  const MarkDetailItem({
    Key? key,
    required this.title,
    required this.size,
    required this.marks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pos = 0;
    for (int i = 0; i < marks.length; i++) {
      if (marks[i].termId == title) {
        pos = i;
        break;
      }
    }
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: rose50,
              borderRadius: BorderRadius.circular(6),
            ),
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SampleText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
          ),
          ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: size,
              itemBuilder: (context, index) {
                return MarkItem(
                  mon: marks[pos+index].moduleName,
                  dqt: marks[pos+index].dqt.toString(),
                  thi: marks[pos+index].thi.toString(),
                  tkhp: marks[pos+index].tkhp.toString(),
                  index: 2,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
