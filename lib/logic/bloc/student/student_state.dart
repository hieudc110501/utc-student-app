// ignore_for_file: public_member_api_docs, sort_ructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

import 'package:utc_student_app/data/models/calendar.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/news.dart';
import 'package:utc_student_app/data/models/student.dart';

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
  StudentStateInfoSuccess(
    this.student,
    this.news,
  ) : super(isLoading: false);
}

class StudentStateMarkSuccess extends StudentState {
  final List<Mark> listMark;
  StudentStateMarkSuccess(this.listMark) : super(isLoading: false);
}

class StudentStateScheduleSuccess extends StudentState {
  final List<Calendar> listCalendar;
  StudentStateScheduleSuccess(this.listCalendar) : super(isLoading: false);
}
