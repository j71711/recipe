part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoadingState extends LoginState {}

final class SuccessesState extends LoginState {}

final class FailedState extends LoginState {
  final String message;

  FailedState({required this.message});
}



