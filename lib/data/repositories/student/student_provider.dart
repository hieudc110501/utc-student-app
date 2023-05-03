import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/calendar.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/utils/url.dart';

class StudentProvider {
  final Dio _dio = Dio();

  //kiểm tra đăng nhập
  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(postLogin, data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        if (response.data == true) {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //đồng bộ dữ liệu sinh viên
  Future<bool> syncData(String username, String password) async {
    try {
      await _dio.post(studentInsert, data: {
        'username': username,
        'password': password,
      });
      await _dio.post(newsInsert, data: {
        'username': username,
        'password': password,
      });
      await _dio.post(scheduleInsert, data: {
        'username': username,
        'password': password,
      });
      await _dio.post(scheduleInsertExam, data: {
        'username': username,
        'password': password,
      });
      await _dio.post(markInsertMarkTerm, data: {
        'username': username,
        'password': password,
      });
      await _dio.post(markInsertGPA, data: {
        'username': username,
        'password': password,
      });
      await _dio.post(tuitionInsert, data: {
        'username': username,
        'password': password,
      });
      await _dio.post(pointInsert, data: {
        'username': username,
        'password': password,
      });

      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //lấy thông tin sinh viên
  Future<Student> fetchStudent(String username) async {
    try {
      final response = await _dio.get('$studentGet/$username');
      if (response.statusCode == 200) {
        return Student.fromJson(jsonEncode(response.data));
      } else {
        throw Exception('Fail to load Student data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //lấy tin tức
  Future<List<News>> fetchNews(String username) async {
    try {
      final response = await _dio.get(newsGet);
      if (response.statusCode == 200) {
        List x = response.data;
        List<News> news = x.map((e) => News.fromJson(jsonEncode(e))).toList();
        return news;
      } else {
        throw Exception('Fail to load News data');
      }
    } catch (e) {
      throw Exception(e.toString());
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

  //lấy lịch sinh viên
  Future<List<Calendar>> fetchSchedule(String username) async {
    try {
      final response = await _dio.get('$getScheduleById$username');
      if (response.statusCode == 200) {
        List schedule = response.data;
        List<Calendar> calendar =
            schedule.map((e) => Calendar.fromJson(jsonEncode(e))).toList();
        return calendar;
      } else {
        throw Exception('Fail to load Student data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
