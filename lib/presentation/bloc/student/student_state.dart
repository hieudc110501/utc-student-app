// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:utc_student_app/data/models/student.dart';

abstract class StudentState extends Equatable {
  final bool isLoading;
  const StudentState({
    required this.isLoading,
  });

  @override
  List<Object> get props => [];
}

class StudentStateInitial extends StudentState {
  const StudentStateInitial({
    required super.isLoading,
  });
}

class StudentStateSuccess extends StudentState {
  final Student student;
  const StudentStateSuccess(
    this.student, {
    required super.isLoading,
  });
}

class StudentStateError extends StudentState {
  const StudentStateError({
    required super.isLoading,
  });
}
