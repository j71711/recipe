import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/authentication/login/bloc/login_bloc.dart';
import 'package:capstone1/screens/authentication/login/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: "jalnar@gmail.com");
    final passwordController = useTextEditingController(text: "1234");
    final loadingKey = GlobalKey();
    final lottieController = useAnimationController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 246),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (loadingKey.currentContext != null &&
              loadingKey.currentContext!.mounted) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          switch (state) {
            case LoginInitial _:
              break;

            case LoadingState _:
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) =>
                    Center(key: loadingKey, child: CircularProgressIndicator()),
              );
              break;
            case SuccessesState _:
              context.go(RouteKey.bottomNavScreen);
              break;

            case FailedState _:
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: Container(
                    height: 100,
                    width: 220,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        state.message,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
              break;
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Sizer(
              builder: (context, orientation, screenType) {
                final cardSize = screenType == ScreenType.mobile
                    ? 125.sw
                    : 80.sw;

                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Lottie.asset(
                            'assets/lottie/welcome.json',
                            controller: lottieController,
                            width: 400,
                            height: 250,
                            fit: BoxFit.fill,
                            onLoaded: (composition) {
                              lottieController.duration = composition.duration;
                              lottieController.forward();
                              lottieController.addListener(() {
                                if (lottieController.value >= 0.35) {
                                  lottieController.stop();
                                }
                              });
                            },
                          ),
                        ),

                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: SizedBox(
                            height: cardSize,
                            width: cardSize,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Gap(32),
                                  TextfieldWidget(
                                    title: "email",
                                    hint: "jalnar@gmail.com",
                                    controller: emailController,
                                  ),
                                  Gap(16),
                                  TextfieldWidget(
                                    title: "password",
                                    hint: "********",
                                    controller: passwordController,
                                  ),
                                  Gap(24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              53,
                                              83,
                                              253,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(20),
                                  SizedBox(
                                    width: 100.w,
                                    height: 7.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          53,
                                          83,
                                          253,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),

                                      onPressed: () {
                                        context.read<LoginBloc>().add(
                                          LoginRequestEvent(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "login",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                            255,
                                            245,
                                            245,
                                            245,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(16),
                                  SizedBox(
                                    width: 100.w,
                                    height: 7.h,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          side: BorderSide(
                                            color: Color.fromARGB(
                                              255,
                                              53,
                                              83,
                                              253,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "sign up",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                            255,
                                            53,
                                            83,
                                            253,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
