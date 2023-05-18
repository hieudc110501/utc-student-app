import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/models/comment.dart';
import 'package:utc_student_app/data/models/schedule.dart';
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/data/models/gpa.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/point.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/models/tuition.dart';
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
      final response = await _dio.get(controllerInsertAll, data: {
        'username': username,
        'password': password,
      });
      if (response.data) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //xóa tất cả dữ liệu
  Future<bool> deleteAll(String username) async {
    try {
      final response = await _dio.get('$controllerDeleteAll/$username');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //kiếm tra xem đã đồng bộ chưa
  Future<bool> checkSync(String username) async {
    try {
      final response = await _dio.get('$studentGet/$username');
      if (response.statusCode == 200) {
        if (response.data == false) {
          return false;
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //lấy thông tin sinh viên
  Future<Student> fetchStudent(String username) async {
    try {
      final response = await _dio.get('$studentGet/$username');
      if (response.statusCode == 200) {
        return Student.fromJson(jsonEncode(response.data));
      } else {
        throw Exception('Không tải được dữ liệu');
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
      final response = await _dio.get('$markGetAll/$username');
      if (response.statusCode == 200) {
        List x = response.data;
        List<Mark> mark = x.map((e) => Mark.fromJson(jsonEncode(e))).toList();
        return mark;
      } else {
        throw Exception('Không tải được dữ liệu');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //lấy gpa sinh viên
  Future<List<GPA>> fetchGPA(String username) async {
    try {
      final response = await _dio.get('$markGetGPA/$username');
      if (response.statusCode == 200) {
        List x = response.data;
        List<GPA> gpa = x.map((e) => GPA.fromJson(jsonEncode(e))).toList();
        return gpa;
      } else {
        throw Exception('Không tải được dữ liệu');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //lấy lịch sinh viên
  Future<List<Schedule>> fetchSchedule(String username) async {
    try {
      final response = await _dio.get('$scheduleGet/$username');
      if (response.statusCode == 200) {
        List schedule = response.data;
        List<Schedule> calendar =
            schedule.map((e) => Schedule.fromJson(jsonEncode(e))).toList();
        return calendar;
      } else {
        throw Exception('Fail to load Calendar data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //lấy lịch thi sinh viên
  Future<List<Exam>> fetchExam(String username) async {
    try {
      final response = await _dio.get('$scheduleGetExam/$username');
      if (response.statusCode == 200) {
        List schedule = response.data;
        List<Exam> calendar =
            schedule.map((e) => Exam.fromJson(jsonEncode(e))).toList();
        return calendar;
      } else {
        throw Exception('Fail to load Exam data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //lấy lịch học phí
  Future<List<Tuition>> fetchTuition(String username) async {
    try {
      final response = await _dio.get('$tuitionGet/$username');
      if (response.statusCode == 200) {
        List data = response.data;
        List<Tuition> tuitions =
            data.map((e) => Tuition.fromJson(jsonEncode(e))).toList();
        return tuitions;
      } else {
        throw Exception('Fail to load Tuition data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //lấy lịch học phí
  Future<List<Point>> fetchPoint(String username) async {
    try {
      final response = await _dio.get('$pointGet/$username');
      if (response.statusCode == 200) {
        List data = response.data;
        List<Point> points =
            data.map((e) => Point.fromJson(jsonEncode(e))).toList();
        return points;
      } else {
        throw Exception('Fail to load Point data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
