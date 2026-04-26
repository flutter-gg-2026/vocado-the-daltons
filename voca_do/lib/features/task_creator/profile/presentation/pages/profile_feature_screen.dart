import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:voca_do/core/extensions/context_extensions.dart';
import 'package:voca_do/core/utils/formatters.dart';
import 'package:voca_do/features/auth/sub/logout/presentation/pages/logout_feature_widget.dart';
import 'package:voca_do/features/task_creator/profile/presentation/cubit/profile_cubit.dart';
import 'package:voca_do/features/task_creator/profile/presentation/cubit/profile_state.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 28, 
            fontWeight: FontWeight.bold, 
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileLoadingState) {
                    context.showLoading();
                  } else {
                    context.hideLoading();
                  }
                  if (state is ProfileErrorState) {
                    context.showSnackBar(state.message, isError: true);
                  }
                },
                builder: (context, state) {
                  if (state is ProfileSuccessState) {
                    return Column(
                      children: [
                        Gap(4.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(25.sp),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFA583C0), Color(0xFF6A1B9A)],
                            ),
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6A1B9A),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40.sp,
                                backgroundColor: Colors.white.withAlpha(40),
                                child: Icon(
                                  Icons.person,
                                  size: 50.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Gap(2.h),
                              Text(
                                state.profile.name.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Gap(0.5.h),
                              const Text(
                                "Mobile Application Developer",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Gap(4.h),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Member since: ${Formatters.formatFullDate(state.profile.createdAt)}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return SizedBox.shrink(); 
                },
              ),
              Gap(8.h),
              const Divider(thickness: 3, color: Color(0xFFEEEEEE)),
              Gap(2.h),
              LogoutFeatureWidget(),
              Gap(4.h),
            ],
          ),
        ),
      ),
    );
  }
}