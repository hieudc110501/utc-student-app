
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class HomeBox extends StatelessWidget {
  final String image;
  final String text;
  const HomeBox({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: whiteText,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withAlpha(10),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              image,
              scale: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SampleText(
                text: text,
                fontWeight: FontWeight.w600,
                size: 16,
                color: greyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
