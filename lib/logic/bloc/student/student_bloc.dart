import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/data/local/repository/local_repository.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentStateInitial(isLoading: false)) {
    final StudentRepository studentRepository = StudentRepository();
    final LocalRepository localRepository = LocalRepository();

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

        final checkLocal = await localRepository.check(event.username);
        if (!checkLocal) {
          //fecth
          final student = await studentRepository.fetchStudent(event.username);
          final gpas = await studentRepository.fetchGPA(event.username);
          final schedules =
              await studentRepository.fetchSchedule(event.username);
          final marks = await studentRepository.fetchMark(event.username);
          final exams = await studentRepository.fetchExam(event.username);
          final points = await studentRepository.fetchPoint(event.username);
          final tuitions = await studentRepository.fetchTuition(event.username);
          final news = await studentRepository.fetchNews(event.username);

          //save
          await localRepository.insertStudent(student);
          await localRepository.insertGpa(gpas);
          await localRepository.insertSchedule(schedules);
          await localRepository.insertMark(marks);
          await localRepository.insertExam(exams);
          await localRepository.insertPoint(points);
          await localRepository.insertTuition(tuitions);
          await localRepository.insertNews(news);
        }

        emit(StudentStateSyncSuccess());
      } catch (e) {
        emit(StudentStateSyncFailure(e.toString()));
      }
    });

    //lấy thông tin
    on<StudentEventLoadData>((event, emit) async {
      try {
        // final student = await studentRepository.fetchStudent(event.username);
        // final news = await studentRepository.fetchNews(event.username);
        // final tuitions = await studentRepository.fetchTuition(event.username);
        // final points = await studentRepository.fetchPoint(event.username);
        final student = await localRepository.getStudent(event.username);
        final news = await localRepository.getNews();
        final tuitions = await localRepository.getTuition(event.username);
        final points = await localRepository.getPoint(event.username);
        emit(StudentStateInfoSuccess(student, news, tuitions, points));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy điểm
    on<StudentEventLoadMark>((event, emit) async {
      try {
        // final mark = await studentRepository.fetchMark(event.username);
        // final gpa = await studentRepository.fetchGPA(event.username);
        final mark = await localRepository.getMark(event.username);
        final gpa = await localRepository.getGpa(event.username);

        emit(StudentStateMarkSuccess(mark, gpa));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy lịch
    on<StudentEventLoadSchedule>((event, emit) async {
      try {
        // final calendar = await studentRepository.fetchSchedule(event.username);
        // final exam = await studentRepository.fetchExam(event.username);
        final calendar = await localRepository.getSchedule(event.username);
        final exam = await localRepository.getExam(event.username);
        emit(StudentStateScheduleSuccess(calendar, exam));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //lấy thông tin
    on<StudentEventLoadProfile>((event, emit) async {
      try {
        // final gpa = await studentRepository.fetchGPA(event.username);
        // final student = await studentRepository.fetchStudent(event.username);
        final student = await localRepository.getStudent(event.username);
        final gpa = await localRepository.getGpa(event.username);
        emit(StudentStateProfileSuccess(student, gpa));
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });

    //xóa hết thông tin
    on<StudentEventDeleteData>((event, emit) async {
      try {
        await studentRepository.deleteAll(event.username);
        emit(StudentStateDeleteSuccess());
      } catch (e) {
        emit(StudentStateError(e.toString()));
      }
    });
  }
}
