import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

void showSnackBar({
  required BuildContext context,
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SampleText(
        text: text,
        fontWeight: FontWeight.w500,
        size: 14,
        color: whiteText,
      ),
    ),
  );
}
