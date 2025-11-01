import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SigninLoading extends AuthState {}

class SigninSuccess extends AuthState {}

class SigninFailure extends AuthState {
  final String message;
  const SigninFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class SignupLoading extends AuthState {}

class SignupSuccess extends AuthState {}

class SignupFailure extends AuthState {
  final String message;
  const SignupFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class SendPasswordResetEmailLoading extends AuthState {}

class SendPasswordResetEmailSuccess extends AuthState {}

class SendPasswordResetEmailFailure extends AuthState {
  final String message;
  const SendPasswordResetEmailFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class SignOutLoading extends AuthState {}

class SignOutSuccess extends AuthState {}

class SignOutFailure extends AuthState {
  final String message;
  const SignOutFailure({required this.message});
  @override
  List<Object> get props => [message];
}
