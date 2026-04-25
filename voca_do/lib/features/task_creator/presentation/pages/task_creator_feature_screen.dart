import 'package:bottom_bar/bottom_bar.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voca_do/core/constants/app_colors.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/presentation/cubit/add_task_screen_cubit.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/presentation/pages/add_task_screen_feature_screen.dart';
import 'package:voca_do/features/task_creator/sub/admin_home_screen/presentation/cubit/admin_home_screen_cubit.dart';
import 'package:voca_do/features/task_creator/sub/admin_home_screen/presentation/pages/admin_home_screen_feature_screen.dart';

enum _SelectedTab { home, favorite, add, search, person }

class TaskCreatorFeatureScreen extends StatefulWidget {
  const TaskCreatorFeatureScreen({super.key});

  @override
  State<TaskCreatorFeatureScreen> createState() =>
      _TaskCreatorFeatureScreenState();
}

class _TaskCreatorFeatureScreenState extends State<TaskCreatorFeatureScreen> {
  _SelectedTab _selectedTab = _SelectedTab.home;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => AddTaskScreenCubit(GetIt.I.get()),
      child: const AddTaskScreenFeatureScreen(),
    ),
   BlocProvider(
      create: (context) => AdminHomeScreenCubit(GetIt.I.get()),
      child: const AdminHomeScreenFeatureScreen(),
    ), BlocProvider(
      create: (context) => AdminHomeScreenCubit(GetIt.I.get()),
      child: const AdminHomeScreenFeatureScreen(),
    ), BlocProvider(
      create: (context) => AdminHomeScreenCubit(GetIt.I.get()),
      child: const AdminHomeScreenFeatureScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: IndexedStack(
        index: _SelectedTab.values.indexOf(_selectedTab),
        children: _pages,
      ),

      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        height: 10,
        unselectedItemColor: Colors.white70,
        borderWidth: 2,
        outlineBorderColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: (i) {
          setState(() {
            _selectedTab = _SelectedTab.values[i];
          });
        },
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home,
            unselectedIcon: Icons.home_outlined,
            selectedColor: AppColors.divider,
          ),
          CrystalNavigationBarItem(
            icon: Icons.group,
            unselectedIcon: Icons.group_outlined,
            selectedColor: Colors.red,
          ),
          CrystalNavigationBarItem(
            icon:Icons.checklist,
            unselectedIcon: Icons.checklist,
            selectedColor: AppColors.primary,
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
