import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/mark/mark_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class MarkDetailItem extends StatelessWidget {
  final String title;
  const MarkDetailItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            behavior: ScrollBehavior(),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return const MarkItem(
                  mon: 'Công nghệ phần mềm',
                  dqt: '10',
                  thi: '10',
                  tkhp: '10',
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
