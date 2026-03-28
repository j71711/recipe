import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:capstone1/repo/authentication_repo.dart';
import 'package:meta/meta.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthenticationRepo authRepo;

  SignupBloc(this.authRepo) : super(SignupInitial()) {
    on<SignupRequestEvent>(signupMethod);
  }

  FutureOr<void> signupMethod(
    SignupRequestEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoadingState());

    (await authRepo.signUp(email: event.email, password: event.password)).fold(
      (onLeft) {
        emit(SignupFailedState(message: onLeft));
      },
      (onRight) {
        emit(SignupSuccessState());
      },
    );
  }
}
