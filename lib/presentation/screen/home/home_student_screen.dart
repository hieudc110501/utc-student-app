
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/logic/notification/push_notification.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


class HomeStudentScreen extends StatefulWidget {
  final Student student;
  const HomeStudentScreen({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {

  @override
  void initState() {
    pushNotification(
      flutterLocalNotificationsPlugin,
      'Xin chào ${widget.student.studentName}',
      'Hãy vào app để theo dõi tin tức, lịch học và bảng điểm mới nhất!'
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            'assets/icons/avatar.png',
            scale: 3,
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SampleText(
                  text: widget.student.studentName,
                  fontWeight: FontWeight.w700,
                  size: 16,
                  color: greyText,
                ),
                SampleText(
                  text:
                      'Mã sinh viên: ${widget.student.studentId}',
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: greyText,
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}
