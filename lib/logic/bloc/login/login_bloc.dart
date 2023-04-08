import 'package:bloc/bloc.dart';
import 'package:utc_student_app/logic/bloc/login/login_event.dart';
import 'package:utc_student_app/logic/bloc/login/login_state.dart';
import 'package:utc_student_app/logic/repositories/student_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(StudentRepository studentRepository)
      : super(const LoginStateInitial(false, '')) {
    on<LoginEventSubmit>((event, emit) async {
      emit(const LoginStateLoading(true, 'Đang đăng nhập...'));
      try {
        final bool check =
            await studentRepository.login(event.username, event.password);
        if (check) {
          emit(const LoginStateSuccess(false, ''));
        } else {
          emit(const LoginStateFailure('Fail'));
        }
      } catch (e) {
        emit(const LoginStateLoading(false, ''));
        emit(LoginStateFailure(e.toString()));
      }
    });
  }
}
