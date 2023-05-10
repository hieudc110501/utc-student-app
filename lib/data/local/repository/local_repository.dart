import 'package:utc_student_app/data/local/repository/local_provider.dart';
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/data/models/gpa.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/point.dart';
import 'package:utc_student_app/data/models/schedule.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/models/tuition.dart';

class LocalRepository {
  final localProvider = LocalProvider();

  //check
  Future check(String id) => localProvider.check(id);

  //student
  Future insertStudent(Student student) => localProvider.insertStudent(student);
  Future getStudent(String id) => localProvider.getStudent(id);
  Future deleteStudent(String id) => localProvider.deleteStudent(id);

  //gpa
  Future insertGpa(List<GPA> gpas) => localProvider.insertGpa(gpas);
  Future getGpa(String id) => localProvider.getGpa(id);
  Future deleteGpa(String id) => localProvider.deleteGpa(id);

  //schedule
  Future insertSchedule(List<Schedule> schedules) =>
      localProvider.insertSchedule(schedules);
  Future getSchedule(String id) => localProvider.getSchedule(id);
  Future deleteSchedule(String id) => localProvider.deleteSchedule(id);

  //mark
  Future insertMark(List<Mark> marks) => localProvider.insertMark(marks);
  Future getMark(String id) => localProvider.getMark(id);
  Future deleteMark(String id) => localProvider.deleteMark(id);

  //exam
  Future insertExam(List<Exam> exams) => localProvider.insertExam(exams);
  Future getExam(String id) => localProvider.getExam(id);
  Future deleteExam(String id) => localProvider.deleteExam(id);

  //tuition
  Future insertTuition(List<Tuition> tuitions) =>
      localProvider.insertTuition(tuitions);
  Future getTuition(String id) => localProvider.getTuition(id);
  Future deleteTuition(String id) => localProvider.deleteTuition(id);

  //point
  Future insertPoint(List<Point> points) => localProvider.insertPoint(points);
  Future getPoint(String id) => localProvider.getPoint(id);
  Future deletePoint(String id) => localProvider.deletePoint(id);

  //news
  Future insertNews(List<News> newss) => localProvider.insertNews(newss);
  Future getNews() => localProvider.getNews();
  Future deleteNews() => localProvider.deleteNews();

  //controller
  Future deleteAll(String id) => localProvider.deleteAll(id);
  Future insertAll(
    Student student,
    List<GPA> gpas,
    List<Schedule> schedules,
    List<Mark> marks,
    List<Exam> exams,
    List<Point> points,
    List<Tuition> tuitions,
    List<News> news,
  ) =>
      localProvider.insertAll(
          student, gpas, schedules, marks, exams, points, tuitions, news);
}
