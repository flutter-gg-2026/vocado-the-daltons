import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:voca_do/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:voca_do/features/auth/login/presentation/pages/login_feature_screen.dart';
import 'package:voca_do/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:voca_do/features/auth/sign_up/presentation/pages/sign_up_feature_screen.dart';
import 'package:voca_do/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_index_screen.dart';

import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.taskCreator,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GetIt.I.get()),
          child: const LoginFeatureScreen(),
        ),
      ),
      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(GetIt.I.get()),
          child: const SignUpFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.taskCreator,
        builder: (context, state) => const TaskCreatorFeatureScreen(),
      ),

      // =======
      // GoRoute(
      //   path: Routes.taskList,
      //   builder: (context, state) {
      //     final extra = state.extra as Map<String, dynamic>;

      //     return BlocProvider.value(
      //       value: GetIt.I<TaskViewerCubit>(),
      //       child: TaskListScreen(
      //         title: extra['title'] as String,
      //         tasks: extra['tasks'] as List<TaskViewerEntity>,
      //         assigneeId: extra['assigneeId'] as String,
      //       ),
      //     );
      //   },
      // ),

      // GoRoute(
      //   path: Routes.taskList,
      //   builder: (context, state) {
      //     final extra = state.extra as Map<String, dynamic>? ?? {};

      //     return BlocProvider(
      //       create: (context) => GetIt.I<TaskViewerCubit>(),
      //       child: TaskIndexScreen(
      //         assigneeId: extra['assigneeId'] as String,
      //         userName: extra['userName'] as String,
      //       ),
      //     );
      //   },
      // ),
      GoRoute(
        path: Routes.taskList,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;

          final assigneeId = extra?['assigneeId'];
          final userName = extra?['userName'];

          if (assigneeId == null || userName == null) {
            return const Scaffold(
              body: Center(child: Text('Missing data when navigating')),
            );
          }

          return BlocProvider(
            create: (context) => GetIt.I<TaskViewerCubit>(),
            child: TaskIndexScreen(assigneeId: assigneeId, userName: userName),
          );
        },
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
