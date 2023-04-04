import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/model/calendar.dart';


//lấy lịch của sinh viên
Future<Calendar> fecthCalendar(String username, String password) async {
  final dio =  Dio();
  final response = await dio.get("http://192.168.10.47/checkLogged?username=$username&password=$password");
  if (response.statusCode == 200) {
    return Calendar.fromJson(jsonEncode(response.data));
  } else {
    throw Exception('Fail to load Student data');
  }
}
