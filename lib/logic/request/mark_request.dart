// lấy thông tin sinh viên
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/mark.dart';

Future<List<Mark>> fecthMark(String username) async {
  final dio =  Dio();
  final response = await dio.get("http://192.168.10.47/fetchMark/$username");
  if (response.statusCode == 200) {
    List x = response.data;
    List<Mark> mark = x.map((e) => Mark.fromJson(jsonEncode(e))).toList();
    return mark;
  } else {
    throw Exception('Fail to load Student data');
  }
}
