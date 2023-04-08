import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final bool isLoading;
  final String? message;
  const LoginState(
    this.isLoading,
    this.message,
  );

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial(
    super.isLoading,
    super.message,
  );
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading(
    super.isLoading,
    super.message,
  );
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess(
    super.isLoading,
    super.message,
  );
}

class LoginStateFailure extends LoginState {
  final String error;

  const LoginStateFailure(this.error) : super(false, 'Đăng nhập thất bại');

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Đăng nhập thất bại {$error}';
}
