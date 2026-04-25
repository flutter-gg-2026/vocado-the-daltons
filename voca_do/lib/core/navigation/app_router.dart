import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:voca_do/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:voca_do/features/auth/login/presentation/pages/login_feature_screen.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:voca_do/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_viewer_feature_screen.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/auth/sign_up/presentation/pages/sign_up_feature_screen.dart';
import 'package:voca_do/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.signUp,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GetIt.I.get()),
          child: const LoginFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.taskCreator,
        builder: (context, state) => BlocProvider(
          create: (context) => TaskCreatorCubit(GetIt.I.get()),
          child: const TaskCreatorFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.taskViewer,
        builder: (context, state) => BlocProvider(
          create: (context) => TaskViewerCubit(GetIt.I.get()),
          child: const TaskViewerFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(GetIt.I.get()),
          child: const SignUpFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
