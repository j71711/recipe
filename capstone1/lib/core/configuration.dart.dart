import 'package:capstone1/repo/authentication_repo.dart';
import 'package:get_it/get_it.dart';

//no need to create instance for all screen GetIt.I. dose it for you
abstract class Configuration {
  static void configureDependencies() {
    GetIt.I.registerSingleton<AuthenticationRepo>(
      AuthenticationRepo(),
    );
  }
}
