import 'package:flutter/cupertino.dart';
import 'package:utc_student_app/presentation/widgets/dialog/generic_dialog.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  required String title,
  required String text,
}) {
  return showGenericDialog(
    context: context,
    title: title,
    content: text,
    optionsBuilder: () => {
      'Xác nhận': null,
    },
  );
}
