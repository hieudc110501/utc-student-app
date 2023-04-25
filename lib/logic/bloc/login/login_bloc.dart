import 'package:bloc/bloc.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/logic/bloc/login/login_event.dart';
import 'package:utc_student_app/logic/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginStateInitial(isLoading: false)) {
    final StudentRepository studentRepository = StudentRepository();

    // sự kiện đăng nhập
    on<LoginEventSubmit>((event, emit) async {
      emit(const LoginStateLoading());
      try {
        final bool check =
            await studentRepository.login(event.username, event.password);
        if (check) {
          emit(const LoginStateSuccess());
        }
      } catch (e) {
        emit(LoginStateFailure(e.toString()));
      }
    });
  }
}
