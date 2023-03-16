import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:utc_student_app/model/student.dart';

Future<Student> fecthStudent() async {
  final dio =  Dio();
  final response = await dio.get("http://192.168.10.47/getStudent");
  if (response.statusCode == 200) {
    return Student.fromJson(jsonEncode(response.data));
  } else {
    throw Exception('Fail to load Student data');
  }
}
