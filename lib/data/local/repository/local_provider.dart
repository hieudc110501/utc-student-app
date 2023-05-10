import 'dart:convert';

import 'package:utc_student_app/data/local/database/constant.dart';
import 'package:utc_student_app/data/local/database/database.dart';
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/data/models/gpa.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/point.dart';
import 'package:utc_student_app/data/models/schedule.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/models/tuition.dart';

class LocalProvider {
  final dbProvider = DatabaseProvider.db;

  //kiểm tra xem student đã có chưa
  Future<bool> check(String id) async {
    try {
      final db = await dbProvider.database;
      final check = await db.query(
        tblStudent,
        where: 'studentId = ?',
        whereArgs: [id],
      );
      if (check.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert student
  Future<bool> insertStudent(Student student) async {
    try {
      final db = await dbProvider.database;
      await db.insert(tblStudent, {
        'studentId': student.studentId,
        'studentName': student.studentName,
        'bankAccount': student.bankAccount,
        'identity': student.identity,
        'birth': student.birth,
        'tel': student.tel,
        'bornIn': student.bornIn,
        'email': student.email,
        'gender': student.gender,
        'updateAt': student.updateAt,
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get student
  Future<Student> getStudent(String id) async {
    try {
      final db = await dbProvider.database;
      final student =
          await db.query(tblStudent, where: 'studentId = ?', whereArgs: [id]);
      return Student.fromJson(jsonEncode(student.first));
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete student
  Future<bool> deleteStudent(String id) async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblStudent, where: 'studentId = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert gpa
  Future<bool> insertGpa(List<GPA> gpas) async {
    try {
      final db = await dbProvider.database;
      gpas.forEach((gpa) async {
        await db.insert(tblGpa, {
          'studentId': gpa.studentId,
          'term': gpa.term,
          'gpa10': gpa.gpa10,
          'gpa4': gpa.gpa4,
          'credit': gpa.credit,
        });
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get gpa
  Future<List<GPA>> getGpa(String id) async {
    try {
      final db = await dbProvider.database;
      final res =
          await db.query(tblGpa, where: 'studentId = ?', whereArgs: [id]);
      List<GPA> gpas = res.map((e) => GPA.fromJson(jsonEncode(e))).toList();
      return gpas;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete gpa
  Future<bool> deleteGpa(String id) async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblGpa, where: 'studentId = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert schedule
  Future<bool> insertSchedule(List<Schedule> schedules) async {
    try {
      final db = await dbProvider.database;
      schedules.forEach((schdule) async {
        await db.insert(tblSchedule, {
          'studentId': schdule.studentId,
          'moduleId': schdule.moduleId,
          'moduleName': schdule.moduleName,
          'startDay': schdule.startDay,
          'endDay': schdule.endDay,
          'weekDay': schdule.weekDay,
          'lesson': schdule.lesson,
          'location': schdule.location,
        });
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get schedule
  Future<List<Schedule>> getSchedule(String id) async {
    try {
      final db = await dbProvider.database;
      final res =
          await db.query(tblSchedule, where: 'studentId = ?', whereArgs: [id]);
      List<Schedule> schedules =
          res.map((e) => Schedule.fromJson(jsonEncode(e))).toList();
      return schedules;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete schedule
  Future<bool> deleteSchedule(String id) async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblSchedule, where: 'studentId = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert mark
  Future<bool> insertMark(List<Mark> marks) async {
    try {
      final db = await dbProvider.database;
      marks.forEach((mark) async {
        await db.insert(tblMark, {
          'moduleId': mark.moduleId,
          'moduleName': mark.moduleName,
          'moduleCredit': mark.moduleCredit,
          'times': mark.times,
          'evaluate': mark.evaluate,
          'dqt': mark.dqt,
          'thi': mark.thi,
          'tkhp': mark.tkhp,
          'studentId': mark.studentId,
          'termId': mark.termId,
        });
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get mark
  Future<List<Mark>> getMark(String id) async {
    try {
      final db = await dbProvider.database;
      final res =
          await db.query(tblMark, where: 'studentId = ?', whereArgs: [id]);
      List<Mark> marks = res.map((e) => Mark.fromJson(jsonEncode(e))).toList();
      return marks;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete mark
  Future<bool> deleteMark(String id) async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblMark, where: 'studentId = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert exam
  Future<bool> insertExam(List<Exam> exams) async {
    try {
      final db = await dbProvider.database;
      exams.forEach((exam) async {
        await db.insert(tblExam, {
          'studentId': exam.studentId,
          'moduleId': exam.moduleId,
          'moduleName': exam.moduleName,
          'credit': exam.credit,
          'date': exam.date,
          'lesson': exam.lesson,
          'identify': exam.identify,
          'room': exam.room,
          'type': exam.type,
        });
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get exam
  Future<List<Exam>> getExam(String id) async {
    try {
      final db = await dbProvider.database;
      final res =
          await db.query(tblExam, where: 'studentId = ?', whereArgs: [id]);
      List<Exam> exams = res.map((e) => Exam.fromJson(jsonEncode(e))).toList();
      return exams;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete exam
  Future<bool> deleteExam(String id) async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblExam, where: 'studentId = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert tuition
  Future<bool> insertTuition(List<Tuition> tuitions) async {
    try {
      final db = await dbProvider.database;
      tuitions.forEach((tuition) async {
        await db.insert(tblTuition, {
          'studentId': tuition.studentId,
          'type': tuition.type,
          'content': tuition.content,
          'term': tuition.term,
          'date': tuition.date,
          'payment': tuition.payment,
          'paid': tuition.paid,
        });
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get tuition
  Future<List<Tuition>> getTuition(String id) async {
    try {
      final db = await dbProvider.database;
      final res =
          await db.query(tblTuition, where: 'studentId = ?', whereArgs: [id]);
      List<Tuition> tuitions =
          res.map((e) => Tuition.fromJson(jsonEncode(e))).toList();
      return tuitions;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete tuition
  Future<bool> deleteTuition(String id) async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblTuition, where: 'studentId = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert point
  Future<bool> insertPoint(List<Point> points) async {
    try {
      final db = await dbProvider.database;
      points.forEach((point) async {
        await db.insert(tblPoint, {
          'studentId': point.studentId,
          'period': point.period,
          'term': point.term,
          'point': point.point,
          'ability': point.ability,
        });
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get point
  Future<List<Point>> getPoint(String id) async {
    try {
      final db = await dbProvider.database;
      final res =
          await db.query(tblPoint, where: 'studentId = ?', whereArgs: [id]);
      List<Point> points =
          res.map((e) => Point.fromJson(jsonEncode(e))).toList();
      return points;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete point
  Future<bool> deletePoint(String id) async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblPoint, where: 'studentId = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert news
  Future<bool> insertNews(List<News> newss) async {
    try {
      final db = await dbProvider.database;

      final res = await db.query(tblNews);
      if (res.isNotEmpty) {
        await deleteNews();
      }
      newss.forEach((news) async {
        await db.insert(tblNews, {
          'title': news.title,
          'date': news.date,
          'content': news.content,
        });
      });
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //get news
  Future<List<News>> getNews() async {
    try {
      final db = await dbProvider.database;
      final res = await db.query(tblNews);
      List<News> news = res.map((e) => News.fromJson(jsonEncode(e))).toList();
      return news;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete news
  Future<bool> deleteNews() async {
    try {
      final db = await dbProvider.database;
      await db.delete(tblNews);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //insert all
  Future<bool> insertAll(
    Student student,
    List<GPA> gpas,
    List<Schedule> schedules,
    List<Mark> marks,
    List<Exam> exams,
    List<Point> points,
    List<Tuition> tuitions,
    List<News> news,
  ) async {
    try {
      await insertStudent(student);
      await insertGpa(gpas);
      await insertSchedule(schedules);
      await insertMark(marks);
      await insertExam(exams);
      await insertPoint(points);
      await insertTuition(tuitions);
      await insertNews(news);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }

  //delete all
  Future<bool> deleteAll(String id) async {
    try {
      deleteMark(id);
      deletePoint(id);
      deleteSchedule(id);
      deleteExam(id);
      deleteTuition(id);
      deleteGpa(id);
      deletePoint(id);
      deleteStudent(id);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }
}
