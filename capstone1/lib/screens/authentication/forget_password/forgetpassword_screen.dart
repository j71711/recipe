
import 'package:capstone1/screens/authentication/forget_password/bloc/forgetpassword_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final loadingKey = GlobalKey();

    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 236, 236, 246),
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 236, 236, 246),

        title:  Text("Forgot Password"),
      ),
      body: BlocListener<ForgetPasswordBloc, ForgetpasswordState>(
        listener: (context, state) {
          if (loadingKey.currentContext != null &&
              loadingKey.currentContext!.mounted) {
            context.pop();
          }

          if (state is ForgotLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                key: loadingKey,
                child:  CircularProgressIndicator(),
              ),
            );
          }

          if (state is ForgotSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text("Password changed successfully")),
            );
            context.pop();
          }

          if (state is ForgotFailed) {
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
                               Gap(20),
                               Text(
                                "Reset Password",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                               Gap(32),
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
                               Gap(16),
                              TextField(
                                controller: newPasswordController,
                                decoration: InputDecoration(
                                  labelText: "New Password",
                                  hintText: "Enter new password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                               Gap(24),
                              SizedBox(
                                width: 100.w,
                                height: 7.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:Color.fromARGB(255, 53, 83, 253),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<ForgetPasswordBloc>().add(
                                      ChangePasswordEvent(
                                        email: emailController.text,
                                        newPassword:
                                            newPasswordController.text,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Change Password",
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
