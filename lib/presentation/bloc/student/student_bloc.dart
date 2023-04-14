import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/data/repositories/student_repostitory.dart';
import 'package:utc_student_app/presentation/bloc/student/student_event.dart';
import 'package:utc_student_app/presentation/bloc/student/student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(const StudentStateInitial(isLoading: true)) {
    final StudentRepository studentRepository = StudentRepository();
    on<StudentEventLoadData>((event, emit) async {
      try {
        final student = await studentRepository.fetchStudent(event.username);
        emit(StudentStateSuccess(student, isLoading: false));
      } catch (e) {
        emit(const StudentStateError(isLoading: false));
      }
    });
  }
}
