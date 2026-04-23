import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/auth/login/presentation/cubit/login_cubit.dart';

class LoginFeatureScreen extends StatelessWidget {
  const LoginFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
