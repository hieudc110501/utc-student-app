
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/dialog/generic_dialog.dart';

Future<bool> showDeleteBlogDialog(
  BuildContext context,
) {
  return showGenericDialog(
    context: context,
    title: 'Xóa bài viết',
    content: 'Bạn có chắc chắn muốn xóa bài viết không?',
    optionsBuilder: () => {
      'Hủy': false,
      'Xóa': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
