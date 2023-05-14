// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_ructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/data/models/gpa.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/point.dart';
import 'package:utc_student_app/data/models/schedule.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/models/tuition.dart';

abstract class StudentState extends Equatable {
  bool isLoading;
  StudentState({
    required this.isLoading,
  });

  @override
  List<Object> get props => [];
}

// khởi tạo
class StudentStateInitial extends StudentState {
  StudentStateInitial({required super.isLoading});
}

class StudentStateLoading extends StudentState {
  StudentStateLoading({required super.isLoading});
}

class StudentStateError extends StudentState {
  final String error;
  StudentStateError(this.error) : super(isLoading: false);
}

//đồng bộ dữ liệu thành công
class StudentStateSyncSuccess extends StudentState {
  StudentStateSyncSuccess() : super(isLoading: false);
}

class StudentStateSynched extends StudentState {
  StudentStateSynched() : super(isLoading: false);
}

// đồng bộ dữ liệu thất bại
class StudentStateSyncFailure extends StudentState {
  final String error;
  StudentStateSyncFailure(this.error) : super(isLoading: false);
}

class StudentStateInfoSuccess extends StudentState {
  final Student student;
  final List<News> news;
  final List<Tuition> tuitions;
  final List<Point> points;
  final List<Schedule> schedules;
  final List<Exam> exams;

  StudentStateInfoSuccess(
    this.student,
    this.news,
    this.tuitions,
    this.points,
    this.schedules,
    this.exams,
  ) : super(isLoading: false);
}

class StudentStateMarkSuccess extends StudentState {
  final List<Mark> listMark;
  final List<GPA> listGPA;
  StudentStateMarkSuccess(
    this.listMark,
    this.listGPA,
  ) : super(isLoading: false);
}

class StudentStateScheduleSuccess extends StudentState {
  final List<Schedule> listCalendar;
  final List<Exam> listExam;
  StudentStateScheduleSuccess(
    this.listCalendar,
    this.listExam,
  ) : super(isLoading: false);
}

class StudentStateProfileSuccess extends StudentState {
  final Student student;
  final List<GPA> listGPA;
  StudentStateProfileSuccess(
    this.student,
    this.listGPA,
  ) : super(isLoading: false);
}

class StudentStateBlogSuccess extends StudentState {
  final Student student;
  final List<Blog> blogs;

  StudentStateBlogSuccess(
    this.student,
    this.blogs,
  ) : super(isLoading: false);
}

class StudentStateDeleteSuccess extends StudentState {
  StudentStateDeleteSuccess() : super(isLoading: false);
}
class StudentStateCreateBlogSucces extends StudentState {
  StudentStateCreateBlogSucces() : super(isLoading: false);
}
