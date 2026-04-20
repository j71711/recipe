part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginRequestEvent extends  LoginEvent {
  final String email;
   final String password;

  LoginRequestEvent({required this.email, required this.password});
}