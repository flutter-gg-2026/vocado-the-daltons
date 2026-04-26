import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:voca_do/core/constants/app_colors.dart';
import 'package:voca_do/core/extensions/context_extensions.dart';
import 'package:voca_do/core/navigation/routers.dart';
import 'package:voca_do/core/utils/validators.dart';
import 'package:voca_do/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:voca_do/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final globalKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          context.hideLoading();
          switch (state) {
            case SignUpLoadingState _:
              context.showLoading();
              break;
            case SignUpSuccessState _:
              context.go(Routes.login);
              break;
            case SignUpErrorState _:
              context.showSnackBar(state.message, isError: true);
              break;
            default:
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Gap(3.sh),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 65.sh,
                width: double.infinity,

                child: Form(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 2.sh,
                      children: [
                        Column(
                          spacing: 2.sp,
                          crossAxisAlignment: .start,
                          children: [
                            Text("name", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              controller: nameController,
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
                            Text("Email", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              controller: emailController,
                              validator: Validators.validateEmail,
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
                              //!
                              validator: Validators.validatePassword,
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
                              cubit.getSignUpMethod(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .start,
                          children: [
                            Text(
                              "Already a member? ",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.push(Routes.login);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Sign in",
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
