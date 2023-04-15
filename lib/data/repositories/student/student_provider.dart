import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/mark.dart';
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
      throw Exception('load student data fail');
    }
  }

  //lấy điểm sinh viên
  Future<List<Mark>> fetchMark(String username) async {
    try {
      final response = await _dio.get('$getMarkById$username');
      if (response.statusCode == 200) {
        List x = response.data;
        List<Mark> mark = x.map((e) => Mark.fromJson(jsonEncode(e))).toList();
        return mark;
      } else {
        throw Exception('Fail to load Student data');
      }
    } catch (e) {
      throw Exception('load student data fail');
    }
  }
}
