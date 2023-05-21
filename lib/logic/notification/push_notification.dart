// gửi thông báo
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:utc_student_app/logic/notification/notification.dart';

void pushNotification(
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  String title,
  String body,
) async {
  Noti.initialize(flutterLocalNotificationsPlugin);

  await Noti.showBigTextNotification(
    title: title,
    body: body,
    fln: flutterLocalNotificationsPlugin,
  );
}
