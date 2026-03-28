part of 'forgetpassword_bloc.dart';

@immutable
sealed class ForgetpasswordEvent {}

class ChangePasswordEvent extends ForgetpasswordEvent {
  final String email;
  final String newPassword;

  ChangePasswordEvent({
    required this.email,
    required this.newPassword,
  });
}
