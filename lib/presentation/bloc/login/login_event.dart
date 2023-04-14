import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEventSubmit extends LoginEvent {
  final String username;
  final String password;

  const LoginEventSubmit(
    this.username,
    this.password,
  );
  
  @override
  List<Object?> get props => [username, password];

  @override
  String toString() => 'LoginSubmit username: {username: $username, password: $password}';
}
