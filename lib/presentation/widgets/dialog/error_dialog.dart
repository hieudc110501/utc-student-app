import 'package:flutter/cupertino.dart';
import 'package:utc_student_app/presentation/widgets/dialog/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
    context: context,
    title: 'Thất bại',
    content: text,
    optionsBuilder: () => {
      'Xác nhận': null,
    },
  );
}
