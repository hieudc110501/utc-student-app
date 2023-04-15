import 'package:flutter/material.dart';

class SampleText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  const SampleText({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: size,
        fontWeight: fontWeight,
      ).copyWith(
        color: color,
      ),
      textAlign: TextAlign.left,
    );
  }
}
