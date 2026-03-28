import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:capstone1/controller/Authentication_contrroler.dart';
import 'package:meta/meta.dart';
part 'forgetpassword_event.dart';
part 'forgetpassword_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetpasswordEvent, ForgetpasswordState> {
  ForgetPasswordBloc() : super(ForgotInitial()) {
    on<ChangePasswordEvent>(changePassword);
  }

  FutureOr<void> changePassword(
    ChangePasswordEvent event,
    Emitter<ForgetpasswordState> emit,
  ) async {
    emit(ForgotLoading());

    await Future.delayed(const Duration(seconds: 1));

    if (event.email == AuthController.savedEmail) {
      AuthController.savedPassword = event.newPassword;

      emit(ForgotSuccess());
    } else {
      emit(ForgotFailed("Email not found"));
    }
  }
}
