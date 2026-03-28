import 'package:capstone1/repo/authentication_repo.dart';
import 'package:capstone1/repo/recipe_repo.dart';
import 'package:get_it/get_it.dart';

abstract class Configuration {
  static void configureDependencies() {
    GetIt.I.registerSingleton<AuthenticationRepo>(
      AuthenticationRepo(),
    );

    GetIt.I.registerLazySingleton<RecipeRepo>(
      () => RecipeRepo(),
    );
  }
}
