import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {}

class LoginStateFailure extends LoginState {
  final String error;

  const LoginStateFailure(this.error);

  @override
  List<Object> get props => [];

  @override
  String toString()  => 'Đăng nhập thất bại {$error}';
}
