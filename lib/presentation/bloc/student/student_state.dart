// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/data/models/student.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentStateInitial extends StudentState {
  const StudentStateInitial();
}

class StudentStateInfoSuccess extends StudentState {
  final Student student;
  const StudentStateInfoSuccess(this.student);
}

class StudentStateMarkSuccess extends StudentState {
  final List<Mark> listMark;
  const StudentStateMarkSuccess(this.listMark);
}

class StudentStateError extends StudentState {
  const StudentStateError();
}
