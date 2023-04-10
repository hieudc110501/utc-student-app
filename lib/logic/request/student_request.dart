import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:utc_student_app/data/model/student.dart';

Future<bool> login(String username, String password) async {
  final dio =  Dio();
  final response = await dio.get("http://192.168.10.47/checkLogged?username=$username&password=$password");
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Fail to load Student data');
  }
}

// lấy thông tin sinh viên
Future<Student> fecthStudent(String username, String password) async {
  final dio =  Dio();
  final response = await dio.get("http://192.168.10.47/getStudentByUsername/$username");
  if (response.statusCode == 200) {
    return Student.fromJson(jsonEncode(response.data));
  } else {
    throw Exception('Fail to load Student data');
  }
}
