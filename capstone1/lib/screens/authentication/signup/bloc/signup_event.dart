part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupRequestEvent extends SignupEvent {
  final String email;
  final String password;

  SignupRequestEvent({
    required this.email,
    required this.password,
  });
}
