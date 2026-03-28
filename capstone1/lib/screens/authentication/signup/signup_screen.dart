import 'package:capstone1/screens/authentication/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final loadingKey = GlobalKey();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 221, 251),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 221, 251),
        elevation: 0,
        title: const Text("Sign Up"),
      ),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (loadingKey.currentContext != null &&
              loadingKey.currentContext!.mounted) {
            context.pop();
          }

          if (state is SignupLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                key: loadingKey,
                child: const CircularProgressIndicator(),
              ),
            );
          }

          if (state is SignupSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account created successfully")),
            );
            context.pop();
          }

          if (state is SignupFailedState) {
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
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Sizer(
              builder: (context, orientation, screenType) {
                final cardSize =
                    screenType == ScreenType.mobile ? 120.sw : 80.sw;

                return Center(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: SizedBox(
                        height: cardSize,
                        width: cardSize,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Gap(20),
                              const Text(
                                "Create Account",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(32),
                              TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "jalnar@gmail.com",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              const Gap(16),
                              TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "Enter password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              const Gap(24),
                              SizedBox(
                                width: 100.w,
                                height: 7.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      132,
                                      56,
                                      246,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<SignupBloc>().add(
                                      SignupRequestEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Sign Up",
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
                            ],
                          ),
                        ),
                      ),
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
