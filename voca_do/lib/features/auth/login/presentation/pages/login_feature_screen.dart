import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
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
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final globalKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          context.hideLoading();
          if (state is LoginLoadingState) context.showLoading();
          if (state is LoginSuccessState) {
            if (state.role == UserRole.admin) {
              context.go(Routes.taskCreator);
            } else if (state.role == UserRole.user) {
              context.go(Routes.taskViewer);
            }
          }
          if (state is LoginErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(5.h),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Please sign in to continue",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Gap(6.h),

                  _buildLabel("Email Address"),
                  _buildTextField(
                    controller: emailController,
                    hint: "example@mail.com",
                    icon: Icons.email_outlined,
                    validator: Validators.validateRequired,
                  ),
                  Gap(2.h),

                  _buildLabel("Password"),
                  _buildTextField(
                    controller: passwordController,
                    hint: "••••••••",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: Validators.validateRequired,
                  ),
                  
                  
                  Gap(4.h),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A1B9A), 
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 60),
                      elevation: 8,
                      shadowColor: const Color(0xFF6A1B9A).withAlpha(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  Gap(3.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () => context.push(Routes.signUp),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF6A1B9A),
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp, left: 4.sp),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        prefixIcon: Icon(icon, color: const Color(0xFF6A1B9A)),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 1.5),
        ),
      ),
    );
  }
}