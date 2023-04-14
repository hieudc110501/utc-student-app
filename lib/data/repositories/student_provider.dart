import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/utils/constant.dart';

class StudentProvider {
  final Dio _dio = Dio();

  //lấy thông tin sinh viên
  Future<Student> fetchStudent(String username) async {
    try {
      final response = await _dio.get('$getStudentByUsername$username');
      if (response.statusCode == 200) {
        return Student.fromJson(jsonEncode(response.data));
      } else {
        throw Exception('Fail to load Student data');
      }
    } catch (e) {
      throw Exception ('load student data fail');
    }
  }
}
