

import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/authentication/forget_password/bloc/forgetpassword_bloc.dart';
import 'package:capstone1/screens/authentication/forget_password/forgetpassword_screen.dart';
import 'package:capstone1/screens/authentication/login/bloc/login_bloc.dart';
import 'package:capstone1/screens/authentication/login/login_screen.dart';
import 'package:capstone1/screens/authentication/signup/bloc/signup_bloc.dart';
import 'package:capstone1/screens/authentication/signup/signup_screen.dart';
import 'package:capstone1/screens/bottem_navagtion_bar/bottem_navgation.dart';
import 'package:capstone1/screens/category_screen/Category_screen.dart';
import 'package:capstone1/screens/home_screen/home_screen.dart';
import 'package:capstone1/screens/proflie/profile_screen.dart';
import 'package:capstone1/screens/search/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RouteApp {
  static final routes = GoRouter(
    initialLocation: RouteKey.bottomNavScreen,
    routes: [
      GoRoute(
        path: RouteKey.bottomNavScreen,
        builder: (context, state) => BottomNavScreen(),
      ),
      GoRoute(
        path: RouteKey.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(GetIt.I.get()),
          child: LoginScreen(),
        ),
      ),

      GoRoute(
        path: RouteKey.forgotPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPasswordBloc(),
          child:  ForgotPasswordScreen(),
        ),
      ),

      GoRoute(
        path: RouteKey.signUpScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupBloc(GetIt.I.get()),
          child:  SignUpScreen(),
        ),
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
        builder: (context, state) => SearchScreen(),
      ),

      GoRoute(
        path: RouteKey.profileScreen,
        builder: (context, state) => ProfileScreen(),
      ),
    ],
  );
}
