import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_do/core/navigation/routers.dart';
import 'package:voca_do/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:voca_do/features/auth/login/presentation/pages/login_feature_screen.dart';
import 'package:voca_do/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:voca_do/features/auth/sign_up/presentation/pages/sign_up_feature_screen.dart';
import 'package:voca_do/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:voca_do/features/task_creator/profile/presentation/cubit/profile_cubit.dart';
import 'package:voca_do/features/task_creator/profile/presentation/pages/profile_feature_screen.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_cubit.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/pages/tasks_board_feature_screen.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_cubit.dart';
import 'package:voca_do/features/task_creator/team/presentation/pages/team_feature_screen.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_index_screen.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_list_screen.dart';

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
        path: Routes.profile,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileCubit(GetIt.I.get()),
          child: const ProfileFeatureScreen(),
        ),
      ),
      GoRoute(
        path: Routes.tasksBoard,
        builder: (context, state) => BlocProvider(
          create: (context) => TasksBoardCubit(GetIt.I.get()),
          child: const TasksBoardFeatureScreen(),
        ),
      ),
      GoRoute(
        path: Routes.team,
        builder: (context, state) => BlocProvider(
          create: (context) => TeamCubit(GetIt.I.get()),
          child: const TeamFeatureScreen(),
        ),
      ),
      GoRoute(
        path: Routes.taskCreator,
        builder: (context, state) => const TaskCreatorFeatureScreen(),
      ),

      GoRoute(
        path: Routes.taskViewer,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<TaskViewerCubit>()..getUserTasks(),
          child: const TaskIndexScreen(),
        ),
      ),
      GoRoute(
        path: '${Routes.taskList}/:status',
        builder: (context, state) {
          final status = state.pathParameters['status'] ?? 'new';

          return BlocProvider(
            create: (context) => GetIt.I<TaskViewerCubit>()..getUserTasks(),
            child: TaskListScreen(status: status),
          );
        },
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
