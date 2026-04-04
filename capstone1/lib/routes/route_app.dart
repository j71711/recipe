import 'package:capstone1/model/single_recipe_model.dart';
import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/authentication/forget_password/bloc/forgetpassword_bloc.dart';
import 'package:capstone1/screens/authentication/forget_password/forgetpassword_screen.dart';
import 'package:capstone1/screens/authentication/login/bloc/login_bloc.dart';
import 'package:capstone1/screens/authentication/login/login_screen.dart';
import 'package:capstone1/screens/authentication/signup/bloc/signup_bloc.dart';
import 'package:capstone1/screens/authentication/signup/signup_screen.dart';
import 'package:capstone1/screens/bottom_navigation_bar/bottom_navigation.dart';
import 'package:capstone1/screens/category/bloc/category_bloc.dart';
import 'package:capstone1/screens/category/category.dart';
import 'package:capstone1/screens/favorites/cubit/favorite_cubit.dart';
import 'package:capstone1/screens/favorites/favorites_screen.dart';
import 'package:capstone1/screens/home/home_screen.dart';
import 'package:capstone1/screens/profile/profile_screen.dart';
import 'package:capstone1/screens/recipes/recipe_details_screen.dart';
import 'package:capstone1/screens/search/cubit/search_cubit.dart';
import 'package:capstone1/screens/search/search_screen.dart';
import 'package:capstone1/screens/see_all/see_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RouteApp {
  static final GoRouter routes = GoRouter(
    initialLocation: RouteKey.loginScreen,
    routes: [
      GoRoute(
        path: RouteKey.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(GetIt.I.get()),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.signUpScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupBloc(GetIt.I.get()),
          child: SignUpScreen(),
        ),
      ),

      GoRoute(
        path: RouteKey.forgotPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPasswordBloc(),
          child: ForgotPasswordScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.bottomNavScreen,
        builder: (context, state) => BottomNavScreen(),
      ),

      GoRoute(
        path: RouteKey.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

      GoRoute(
        path: RouteKey.categoryScreen,
        builder: (context, state) => CategoryScreen(),
      ),
      GoRoute(
        path: RouteKey.searchScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit()..getRecipes(),
          child: const SearchScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.profileScreen,
        builder: (context, state) => ProfileScreen(),
      ),

      GoRoute(
        path: RouteKey.seeAllScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final favoriteCubit = data['favoriteCubit'] as FavoriteCubit;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  final bloc = CategoryBloc();
                  bloc.add(
                    LoadCategoryEvent(
                      title: data['title'],
                      recipes: data['recipes'],
                    ),
                  );
                  return bloc;
                },
              ),
              BlocProvider.value(value: favoriteCubit),
            ],
            child: SeeAllScreen(title: data['title'], recipes: data['recipes']),
          );
        },
      ),
      GoRoute(
        path: RouteKey.recipeDetailsScreen,
        builder: (context, state) {
          final recipe = state.extra as SingleRecipeModel?;

          if (recipe == null) {
            return Scaffold(body: Center(child: Text("No recipe found")));
          }
          return RecipeDetailsScreen(recipe: recipe);
        },
      ),
      GoRoute(
        path: RouteKey.favoritesScreen,
        builder: (context, state) {
          final favoriteCubit = state.extra as FavoriteCubit;

          return BlocProvider.value(
            value: favoriteCubit,
            child: FavoritesScreen(),
          );
        },
      ),
    ],
  );
}
