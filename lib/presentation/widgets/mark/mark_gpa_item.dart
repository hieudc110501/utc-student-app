// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class MarkGpaItem extends StatelessWidget {
  final String mon;
  final String dqt;
  final String thi;
  final String tkhp;
  const MarkGpaItem({
    Key? key,
    required this.mon,
    required this.dqt,
    required this.thi,
    required this.tkhp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteText,
        borderRadius: BorderRadius.circular(6),
      ),
      height: 35,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: SampleText(
                text: mon,
                fontWeight: FontWeight.w600,
                size: 14,
                color: grey700,
              ),
            ),
            Expanded(
              child: Center(
                child: SampleText(
                  text: dqt,
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SampleText(
                  text: thi,
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SampleText(
                  text: tkhp,
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: grey700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
