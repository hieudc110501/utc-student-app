import 'package:flutter/material.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';

Future<void> loadingDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        content: Container(
          height: 150,
          width: screenSize.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.transparent),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                flex: 2,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Expanded(
                flex: 1,
                child: SampleText(
                  text: 'Đang đồng bộ dữ liệu...',
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: grey700,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
