import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:capstone1/repo/authentication_repo.dart';
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepo authRepo;
  LoginBloc(this.authRepo) : super(LoginInitial()) {
    on<LoginRequestEvent>(loginMethod);
  }

  

  FutureOr<void> loginMethod(
    LoginRequestEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingState());
    (await authRepo.login(email: event.email, password: event.password)).fold(
      (onLeft) {
        emit(FailedState(message: onLeft));
      },
      (onRight) {
        emit(SuccessesState());
      },
    );
  }
  
}