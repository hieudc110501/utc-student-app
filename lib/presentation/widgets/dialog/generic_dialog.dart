import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: SampleText(
          text: title,
          fontWeight: FontWeight.w700,
          size: 20,
          color: grey700,
        ),
        content: SampleText(
          text: content,
          fontWeight: FontWeight.w500,
          size: 16,
          color: grey500,
        ),
        actions: options.keys.map((optionTitle) {
          final T value = options[optionTitle];
          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: SampleText(
              text: optionTitle,
              fontWeight: FontWeight.w700,
              size: 16,
              color: blue500,
            ),
          );
        }).toList(),
      );
    },
  );
}
