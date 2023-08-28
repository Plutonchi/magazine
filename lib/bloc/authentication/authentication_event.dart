part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthenticationEvent {
  final String email;
  final String password;
  final bool rememberMe;

  @override
  List<Object> get props => [email, password, rememberMe];
  const LoginRequested(
      {required this.email, required this.password, required this.rememberMe});
}

class RegistrationRequested extends AuthenticationEvent {
  final String username;
  final String email;
  final String password;
  const RegistrationRequested({
    required this.username,
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [username, email, password];
}

class ResetPasswordRequested extends AuthenticationEvent {
  final String email;

  ResetPasswordRequested(this.email);
  @override
  List<Object> get props => [email];
}
