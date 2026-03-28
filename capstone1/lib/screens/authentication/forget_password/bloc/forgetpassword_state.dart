part of 'forgetpassword_bloc.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

class ForgotInitial extends ForgetpasswordState {}

class ForgotLoading extends ForgetpasswordState {}

class ForgotSuccess extends ForgetpasswordState {}

class ForgotFailed extends ForgetpasswordState {
  final String message;

  ForgotFailed(this.message);
}
