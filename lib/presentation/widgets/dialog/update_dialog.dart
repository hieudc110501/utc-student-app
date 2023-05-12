
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/dialog/generic_dialog.dart';

Future<bool> showUpdateDialog(
  BuildContext context,
) {
  return showGenericDialog(
    context: context,
    title: 'Cập nhật dữ liệu',
    content: 'Quá trình cập nhật dữ liệu có thể mất vài phút, bạn có chắc chắn muốn cập nhật không?',
    optionsBuilder: () => {
      'Để sau': false,
      'Cập nhật': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
