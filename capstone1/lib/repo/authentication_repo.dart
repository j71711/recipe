import 'package:capstone1/controller/authentication_controller.dart.dart';
import 'package:fpdart/fpdart.dart';

class AuthenticationRepo {
  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final String token = "lakdfsjgnlasdf09kidd-3,kasha94nsdpffuqeb";
      await Future.delayed(Duration(seconds: 2));

      if (email == AuthController.savedEmail &&
          password == AuthController.savedPassword) {
        return Either.right(token);
      }

     return Either.left("email or password incorrect");
    } catch (error) {
      return Either.left("there is error with login");
    }
  }

}