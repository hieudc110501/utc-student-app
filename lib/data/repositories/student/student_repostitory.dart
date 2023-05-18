import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/models/schedule.dart';
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/data/models/gpa.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/point.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/models/tuition.dart';
import 'package:utc_student_app/data/repositories/student/student_provider.dart';

class StudentRepository {
  final _provider = StudentProvider();

  Future<bool> login(String username, String password) {
    return _provider.login(username, password);
  }

  Future<bool> syncData(String username, String password) {
    return _provider.syncData(username, password);
  }

  Future<bool> checkSync(String username) {
    return _provider.checkSync(username);
  }

  Future<Student> fetchStudent(String username) {
    return _provider.fetchStudent(username);
  }

  Future<List<News>> fetchNews(String username) {
    return _provider.fetchNews(username);
  }

  Future<List<Mark>> fetchMark(String username) {
    return _provider.fetchMark(username);
  }

  Future<List<GPA>> fetchGPA(String username) {
    return _provider.fetchGPA(username);
  }

  Future<List<Schedule>> fetchSchedule(String username) {
    return _provider.fetchSchedule(username);
  }

  Future<List<Exam>> fetchExam(String username) {
    return _provider.fetchExam(username);
  }

  Future<List<Tuition>> fetchTuition(String username) {
    return _provider.fetchTuition(username);
  }

  Future<List<Point>> fetchPoint(String username) {
    return _provider.fetchPoint(username);
  }

  Future<bool> deleteAll(String username) {
    return _provider.deleteAll(username);
  }
}
