import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:utc_student_app/utils/color.dart';

showToast(BuildContext context, String text) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(38),
      color: Colors.black,
    ),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          color: whiteText,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
