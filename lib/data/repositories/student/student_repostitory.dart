import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/repositories/student/student_provider.dart';

class StudentRepository {

  final _provider =  StudentProvider();
  Future<Student> fetchStudent(String username) {
    return _provider.fetchStudent(username);
  }

  Future<List<Mark>> fetchMark(String username) {
    return _provider.fetchMark(username);
  }
}
