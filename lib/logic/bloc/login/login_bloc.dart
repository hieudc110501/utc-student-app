import 'package:bloc/bloc.dart';
import 'package:utc_student_app/logic/bloc/login/login_event.dart';
import 'package:utc_student_app/logic/bloc/login/login_state.dart';
import 'package:utc_student_app/logic/repositories/student_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(StudentRepository studentRepository) : super(LoginStateInitial()) {
    on<LoginEventSubmit>((event, emit) async {
      emit(LoginStateLoading());
      try {
        final bool check =
            await studentRepository.login(event.username, event.password);
        if (check) {
          emit(LoginStateSuccess());
        }
      } catch (e) {
        emit(LoginStateFailure(e.toString()));
      }
    });
  }
}
