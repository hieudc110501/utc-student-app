// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class ProfileContainer extends StatelessWidget {
  final String leftIcon;
  final String title;
  final Color textColor;
  const ProfileContainer({
    Key? key,
    required this.leftIcon,
    required this.title,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: FractionallySizedBox(
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            color: whiteText,
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(
            //   color: grey900,
            //   width: 1,
            // ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withAlpha(5),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset(
                          leftIcon,
                          scale: 5,
                        ),
                      ),
                      SampleText(
                        text: title,
                        fontWeight: FontWeight.w600,
                        size: 16,
                        color: textColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/icons/next_icon.png',
                    alignment: Alignment.centerRight,
                    scale: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
