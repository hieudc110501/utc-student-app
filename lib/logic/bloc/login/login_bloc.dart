import 'package:bloc/bloc.dart';
import 'package:utc_student_app/data/local/shared_preferences/shared_preferences_service.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/logic/bloc/login/login_event.dart';
import 'package:utc_student_app/logic/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginStateInitial(isLoading: false)) {
    final StudentRepository studentRepository = StudentRepository();

    // kiểm tra xem đã đăng nhập hay chưa
    on<LoginEventCheck>((event, emit) async {
      emit(const LoginStateLoading());
      try {
        String? check = SharedPreferencesService.preferences.getString('username');
        if (check != null && check != '') {
          emit(const LoginStateSuccess());
        } else {
          emit(const LoginStateInitial(isLoading: false));
        }
      } catch (e) {
        emit(LoginStateFailure(e.toString()));
      }
    });

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
