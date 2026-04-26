import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voca_do/core/constants/app_colors.dart';
import 'package:voca_do/core/constants/app_enums.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/presentation/cubit/add_task_screen_cubit.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/presentation/pages/add_task_screen_feature_screen.dart';
import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/presentation/pages/admin_home_screen_feature_screen.dart';
import 'package:voca_do/features/task_creator/profile/presentation/cubit/profile_cubit.dart';
import 'package:voca_do/features/task_creator/profile/presentation/pages/profile_feature_screen.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_cubit.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/pages/tasks_board_feature_screen.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_cubit.dart';
import 'package:voca_do/features/task_creator/team/presentation/pages/team_feature_screen.dart';

class TaskCreatorFeatureScreen extends StatefulWidget {
  const TaskCreatorFeatureScreen({super.key});

  @override
  State<TaskCreatorFeatureScreen> createState() =>
      _TaskCreatorFeatureScreenState();
}

class _TaskCreatorFeatureScreenState extends State<TaskCreatorFeatureScreen> {
  SelectedTab _selectedTab = SelectedTab.home;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => AddTaskScreenCubit(GetIt.I.get()),
      child: const AddTaskScreenFeatureScreen(),
    ),
    BlocProvider(
      create: (context) => GetIt.I.get<TeamCubit>()..getTeamMethod(),
      child: const TeamFeatureScreen(),
    ),
    BlocProvider(
      create: (context) => TasksBoardCubit(GetIt.I.get()),
      child: const TasksBoardFeatureScreen(),
    ),

    BlocProvider(
      create: (context) => GetIt.I.get<ProfileCubit>()..getProfileMethod(),
      child: const ProfileFeatureScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: IndexedStack(
        index: SelectedTab.values.indexOf(_selectedTab),
        children: _pages,
      ),

      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: SelectedTab.values.indexOf(_selectedTab),
        height: 10,
        unselectedItemColor: Colors.white70,
        borderWidth: 2,
        outlineBorderColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: (i) {
          setState(() {
            _selectedTab = SelectedTab.values[i];
          });
        },
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home,
            unselectedIcon: Icons.home_outlined,
            selectedColor: AppColors.error,
          ),
          CrystalNavigationBarItem(
            icon: Icons.group,
            unselectedIcon: Icons.group_outlined,
            selectedColor: AppColors.primary,
          ),
          CrystalNavigationBarItem(
            icon: Icons.checklist,
            unselectedIcon: Icons.checklist,
            selectedColor: AppColors.info,
          ),
          CrystalNavigationBarItem(
            icon: Icons.person,
            unselectedIcon: Icons.person_outline,
            selectedColor: AppColors.success,
          ),
        ],
      ),
    );
  }
}
