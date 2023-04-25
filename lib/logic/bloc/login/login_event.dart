import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginEventSubmit extends LoginEvent {
  final String username;
  final String password;

  const LoginEventSubmit(
    this.username,
    this.password,
  );
}
