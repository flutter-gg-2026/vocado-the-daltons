import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:voca_do/core/constants/app_colors.dart';
import 'package:voca_do/core/constants/app_enums.dart';
import 'package:voca_do/core/extensions/context_extensions.dart';
import 'package:voca_do/core/navigation/routers.dart';
import 'package:voca_do/core/utils/validators.dart';
import 'package:voca_do/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:voca_do/features/auth/login/presentation/cubit/login_state.dart';

class LoginFeatureScreen extends HookWidget {
  const LoginFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final emailController = useTextEditingController(
      text: "ghayd25@outlook.sa",
    );
    final passwordController = useTextEditingController(text: "gh123456");

    final globalKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            context.hideLoading();
            switch (state) {
              case LoginLoadingState _:
                context.showLoading();
                break;
              case LoginSuccessState _:
                if (state.role == UserRole.admin) {
                  context.go(Routes.taskCreator);
                } else if (state.role == UserRole.user) {
                  context.go(Routes.taskList);
                }
                break;

              case LoginErrorState _:
                context.showSnackBar(state.message, isError: true);
                break;
              default:
            }
          },
          child: Column(
            children: [
              Gap(3),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),

                height: 50.sh,
                width: double.infinity,

                child: Form(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 2,
                      children: [
                        Column(
                          spacing: 2.sp,
                          crossAxisAlignment: .start,
                          children: [
                            Text("Email", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              controller: emailController,
                              validator: Validators.validateRequired,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                        Gap(3),
                        Column(
                          spacing: 2.sp,
                          crossAxisAlignment: .start,
                          children: [
                            Text("Password", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              controller: passwordController,
                              validator: Validators.validateRequired,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 5,
                          ),
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              cubit.getLoginMethod(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.push(Routes.signUp);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
