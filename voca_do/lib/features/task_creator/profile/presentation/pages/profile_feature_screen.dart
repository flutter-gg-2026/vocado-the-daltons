import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:voca_do/core/constants/app_colors.dart';
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
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: const Text('Profile', style: TextStyle(fontSize: 36)),
        ),

        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                        Gap(3.sh),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 30.sh,
                          width: double.infinity,

                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              spacing: 2.sh,
                              children: [
                                Text(
                                  state.profile.name,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: .bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  "Description :........",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: .bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Gap(5.sh),
                                Text(
                                  "Member since: ${Formatters.formatFullDate(state.profile.createdAt)}",
                                  style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Gap(10.sh),
              LogoutFeatureWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
