// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginEventCheck extends LoginEvent {
  const LoginEventCheck();
}

class LoginEventSubmit extends LoginEvent {
  final String username;
  final String password;

  const LoginEventSubmit(
    this.username,
    this.password,
  );
}

