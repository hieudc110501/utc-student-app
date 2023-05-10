// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final bool isLoading;
  const LoginState({
    required this.isLoading,
  });

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial({required super.isLoading});
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading() : super(isLoading: true);
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess() : super(isLoading: false);
}

class LoginStateFailure extends LoginState {
  String error;
  LoginStateFailure(
    this.error,
  ) : super(isLoading: false);
}

class LoginStateSyncDataSuccess extends LoginState {
  const LoginStateSyncDataSuccess() : super(isLoading: false);
}

class LoginStateSyncDataFailure extends LoginState {
  String error;
  LoginStateSyncDataFailure(
    this.error,
  ) : super(isLoading: false);
}
