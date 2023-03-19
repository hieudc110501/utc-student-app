import 'package:flutter/material.dart';
import 'package:utc_student_app/utils/color.dart';

class SampleButton extends StatelessWidget {
  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;
  final String text;
  final String routeName;
  final String? pushNamedAndRemoveUntil;

  const SampleButton({
    super.key,
    required this.text,
    this.fixedSize,
    this.textStyle,
    required this.routeName,
    this.pushNamedAndRemoveUntil,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            indigo900,
            indigo600,
          ],
        ),
        borderRadius: BorderRadius.circular(38),
      ),
      child: ElevatedButton(
        onPressed: () {
          // nếu disable có giá trị thì button không hoạt động
          // nếu button hoạt động check xem có push có remove không
          pushNamedAndRemoveUntil == null
              ? Navigator.pushNamed(context, routeName)
              : Navigator.pushNamedAndRemoveUntil(
                  context, routeName, (route) => false);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          fixedSize: fixedSize,
          //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
          textStyle: textStyle,
        ),
        child: Text(text),
      ),
    );
  }
}
