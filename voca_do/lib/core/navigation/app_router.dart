import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:voca_do/features/auth/login/presentation/pages/login_feature_screen.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_list_screen.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_viewer_screen.dart';

import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/admin_home_screen/presentation/pages/admin_home_screen_feature_screen.dart';
import 'package:voca_do/features/admin_home_screen/presentation/cubit/admin_home_screen_cubit.dart';
import 'package:voca_do/features/add_task_screen/presentation/pages/add_task_screen_feature_screen.dart';
import 'package:voca_do/features/add_task_screen/presentation/cubit/add_task_screen_cubit.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.taskViewer,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),


GoRoute(
  path: Routes.taskList,
  builder: (context, state) {
    final extra = state.extra as Map<String, dynamic>;

    return TaskListScreen(
      title: extra['title'],
      tasks: extra['tasks'],
    );
  },
),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GetIt.I.get()),
          child: const LoginFeatureScreen(),
        ),
      ),


GoRoute(
  path: Routes.taskViewer,
  builder: (context, state) {
    return BlocProvider(
      create: (context) => GetIt.I<TaskViewerCubit>(),
      child: const TaskViewerScreen(),
    );
  },
),



      GoRoute(
        path: Routes.adminHomeScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AdminHomeScreenCubit(GetIt.I.get()),
          child: const AdminHomeScreenFeatureScreen(),
        ),
      ),
    
  GoRoute(
    path: Routes.addTaskScreen,
    builder: (context, state) => BlocProvider(
          create: (context) => AddTaskScreenCubit(GetIt.I.get()),
          child: const AddTaskScreenFeatureScreen(),
        ),
  ),



],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
