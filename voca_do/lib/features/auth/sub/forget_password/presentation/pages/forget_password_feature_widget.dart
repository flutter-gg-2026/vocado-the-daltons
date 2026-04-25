import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voca_do/features/auth/sub/forget_password/presentation/cubit/forget_password_cubit.dart';


class ForgetPasswordFeatureWidget extends StatelessWidget {
  const ForgetPasswordFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<ForgetPasswordCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
