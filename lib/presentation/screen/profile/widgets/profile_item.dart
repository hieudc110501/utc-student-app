
import 'package:flutter/material.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String content;
  const ProfileItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SampleText(
            text: title,
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          SampleText(
            text: content,
            fontWeight: FontWeight.w400,
            size: 14,
            color: grey700,
          ),
        ],
      ),
    );
  }
}
