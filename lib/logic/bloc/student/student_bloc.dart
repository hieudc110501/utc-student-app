import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentStateInitial(isLoading: false)) {
    final StudentRepository studentRepository = StudentRepository();

    //đã đồng bộ dữ liệu
    on<StudentEventSynched>((event, emit) async {
      emit(StudentStateLoading(isLoading: true));
      emit(StudentStateSynched());
    });

    //đồng bộ dữ liệu
    on<StudentEventSyncData>((event, emit) async {
      emit(StudentStateLoading(isLoading: true));
      try {
        final check = await studentRepository.checkSync(event.username);
        if (!check) {
          await studentRepository.syncData(event.username, event.password);
        }
        emit(StudentStateSyncSuccess());
      } catch (e) {
        emit(StudentStateSyncFailure(e.toString()));
      }
    });

    //lấy thông tin
    on<StudentEventLoadData>((event, emit) async {
      try {
        final student = await studentRepository.fetchStudent(event.username);
        final news = await studentRepository.fetchNews(event.username);
        final tuitions = await studentRepository.fetchTuition(event.username);
        final points = await studentRepository.fetchPoint(event.username);
        emit(StudentStateInfoSuccess(student, news, tuitions, points));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy điểm
    on<StudentEventLoadMark>((event, emit) async {
      try {
        final mark = await studentRepository.fetchMark(event.username);
        final gpa = await studentRepository.fetchGPA(event.username);
        emit(StudentStateMarkSuccess(mark, gpa));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy lịch
    on<StudentEventLoadSchedule>((event, emit) async {
      try {
        final calendar = await studentRepository.fetchSchedule(event.username);
        final exam = await studentRepository.fetchExam(event.username);
        emit(StudentStateScheduleSuccess(calendar, exam));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy thông tin
    on<StudentEventLoadProfile>((event, emit) async {
      try {
        final gpa = await studentRepository.fetchGPA(event.username);
        final student = await studentRepository.fetchStudent(event.username);
        emit(StudentStateProfileSuccess(student, gpa));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });
  }
}
