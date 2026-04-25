import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
// <<<<<<< HEAD
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/presentation/cubit/add_task_screen_cubit.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/presentation/pages/add_task_screen_feature_screen.dart';
import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/presentation/cubit/admin_home_screen_cubit.dart';
// =======
// import 'package:voca_do/features/task_creator/sub/add_task_screen/presentation/cubit/add_task_screen_cubit.dart';
// import 'package:voca_do/features/task_creator/sub/add_task_screen/presentation/pages/add_task_screen_feature_screen.dart';
// >>>>>>> af858629c08e1bbc0dd5318776c9cb9345f7aec3
import 'package:voca_do/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:voca_do/features/auth/login/presentation/pages/login_feature_screen.dart';
import 'package:voca_do/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:voca_do/features/auth/sign_up/presentation/pages/sign_up_feature_screen.dart';
// <<<<<<< HEAD
import 'package:voca_do/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_index_screen.dart';
import 'package:voca_do/features/task_viewer/presentation/pages/task_list_screen.dart';
// =======
// import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
// import 'package:voca_do/features/task_viewer/presentation/pages/task_index_screen.dart';
// import 'package:voca_do/features/task_viewer/presentation/pages/task_list_screen.dart';
// >>>>>>> af858629c08e1bbc0dd5318776c9cb9345f7aec3
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/task_creator/profile/presentation/pages/profile_feature_screen.dart';
import 'package:voca_do/features/task_creator/profile/presentation/cubit/profile_cubit.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/pages/tasks_board_feature_screen.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_cubit.dart';
import 'package:voca_do/features/task_creator/team/presentation/pages/team_feature_screen.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_cubit.dart';
import 'package:voca_do/features/task_creator/home/presentation/pages/home_feature_screen.dart';
import 'package:voca_do/features/task_creator/home/presentation/cubit/home_cubit.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
   initialLocation: Routes.taskViewer ,
    routes: [
      // GoRoute(
      //   path: Routes.splash,
      //   builder: (context, state) {
      //     return Scaffold(body: Center(child: Text("splash screen")));
      //   }, // SplashScreen
      // ),

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

// <<<<<<< HEAD
      
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
      

      // GoRoute(
      //   path: Routes.taskCreator,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => TaskCreatorCubit(GetIt.I.get()),
      //     child: const TaskCreatorFeatureScreen(),
      //   ),
      // ),
       GoRoute(
        path: Routes.taskCreator,
        builder: (context, state) => const TaskCreatorFeatureScreen(),
      ),
      // GoRoute(
      //   path: Routes.taskViewer,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => TaskViewerCubit(GetIt.I.get()),
      //     child: const TaskViewerFeatureScreen(),
      //   ),
      // ),
// =======

GoRoute(
  path: Routes.taskList,
  builder: (context, state) {
    final extra = state.extra as Map<String, dynamic>;

    return BlocProvider.value(
      value: GetIt.I<TaskViewerCubit>(),
      child: TaskListScreen(
        title: extra['title'] as String,
        tasks: extra['tasks'] as List<TaskViewerEntity>,
        assigneeId: extra['assigneeId'] as String,
      ),
    );
  },
),
  //  GoRoute(
  //       path: Routes.taskViewer,
  //       builder: (context, state) {
  //         final extra = state.extra as Map<String, dynamic>?;
  //         if (extra == null || extra['assigneeId'] == null) {
  //           return const Scaffold(
  //             body: Center(child: Text("Invalid Task Data")),
  //           );
  //         }
  //         return BlocProvider(
  //           create: (context) => GetIt.I<TaskViewerCubit>(),
  //           child: TaskIndexScreen(
  //             assigneeId: extra['assigneeId'] as String,
  //             userName: extra['userName'] as String? ?? 'Guest',
  //           ),
  //         );
  //       },
  //     ),

GoRoute(
  path: Routes.taskViewer,
  builder: (context, state) {
    final extra = state.extra as Map<String, dynamic>;

    return BlocProvider(
      create: (context) => GetIt.I<TaskViewerCubit>(),
      child: TaskIndexScreen(
        assigneeId: extra['assigneeId'] as String,
        userName: extra['userName'] as String,
      ),
    );
  },
),

      // GoRoute(
      //   path: Routes.adminHomeScreen,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => AdminHomeScreenCubit(GetIt.I.get()),
      //     child: const AdminHomeScreenFeatureScreen(),
      //   ),
      // ),

      // GoRoute(
      //   path: Routes.addTaskScreen,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => AddTaskScreenCubit(GetIt.I.get()),
      //     child: const AddTaskScreenFeatureScreen(),
      //   ),
      // ),

      // GoRoute(
      //   path: Routes.taskCreator,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => TaskCreatorCubit(GetIt.I.get()),
      //     child: const TaskCreatorFeatureScreen(),
      //   ),
      // ),
      GoRoute(
        path: Routes.taskCreator,
        builder: (context, state) => const TaskCreatorFeatureScreen(),
      ),
    
  GoRoute(
// <<<<<<< HEAD
    path: Routes.home,
    builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(GetIt.I.get()),
          child: const HomeFeatureScreen(),
        ),
  ),
// =======
//     path: Routes.addTaskScreen,
//     builder: (context, state) => BlocProvider(
//           create: (context) => AddTaskScreenCubit(GetIt.I.get()),
//           child: const AddTaskScreenFeatureScreen(),
//         ),




// >>>>>>> af858629c08e1bbc0dd5318776c9cb9345f7aec3
],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
