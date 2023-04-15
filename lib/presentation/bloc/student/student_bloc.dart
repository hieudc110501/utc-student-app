import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/presentation/bloc/student/student_event.dart';
import 'package:utc_student_app/presentation/bloc/student/student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(const StudentStateInitial()) {
    final StudentRepository studentRepository = StudentRepository();

    //lấy thông tin
    on<StudentEventLoadData>((event, emit) async {
      try {
        final student = await studentRepository.fetchStudent(event.username);
        emit(StudentStateInfoSuccess(student));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy điểm
    on<StudentEventLoadMark>((event, emit) async {
      try {
        final mark = await studentRepository.fetchMark(event.username);
        emit(StudentStateMarkSuccess(mark));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy lịch
    on<StudentEventLoadSchedule>((event, emit) async {
      try {
        final calendar = await studentRepository.fetchSchedule(event.username);
        emit(StudentStateScheduleSuccess(calendar));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });
  }
}
