import 'package:utc_student_app/data/models/calendar.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/repositories/student/student_provider.dart';

class StudentRepository {

  final _provider =  StudentProvider();
  
  Future<bool> login(String username, String password) {
    return _provider.login(username, password);
  }

  Future<Student> fetchStudent(String username) {
    return _provider.fetchStudent(username);
  }

  Future<List<Mark>> fetchMark(String username) {
    return _provider.fetchMark(username);
  }

  Future<List<Calendar>> fetchSchedule(String username) {
    return _provider.fetchSchedule(username);
  }
}
