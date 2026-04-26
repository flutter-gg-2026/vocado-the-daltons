import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_do/core/navigation/routers.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_horizontal_section.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_vertical_section.dart';

class TaskIndexScreen extends StatelessWidget {
  const TaskIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<TaskViewerCubit, TaskViewerState>(
        builder: (context, state) {
          if (state is TaskViewerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TaskViewerError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (state is TaskViewerSuccess) {
            final tasks = state.dashboard.tasks;
            final newTasks = tasks
                .where((task) => task.status.toLowerCase() == 'new')
                .toList();
            final lateTasks = tasks
                .where((task) => task.status.toLowerCase() == 'late')
                .toList();
            final inProgressTasks = tasks
                .where((task) => task.status.toLowerCase() == 'in_progress')
                .toList();

            return SafeArea(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListView(
                  children: [
                    Text(
                      'Hello, ${state.dashboard.userName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TaskHorizontalSection(
                      title: '${newTasks.length} New tasks today',
                      tasks: newTasks,
                      type: TaskHorizontalSectionType.newTask,
                      onViewAll: () => _goToTaskList(
                        context: context,
                        status: 'new',
                      ),
                    ),
                    const SizedBox(height: 26),
                    TaskHorizontalSection(
                      title: 'Late',
                      count: lateTasks.length.toString(),
                      countColor: const Color(0xffFF6F79),
                      tasks: lateTasks,
                      type: TaskHorizontalSectionType.late,
                      onViewAll: () => _goToTaskList(
                        context: context,
                        status: 'late',
                      ),
                    ),
                    const SizedBox(height: 26),
                    TaskVerticalSection(
                      title: 'In Progress',
                      count: inProgressTasks.length.toString(),
                      countColor: const Color(0xffFFE37A),
                      tasks: inProgressTasks,
                      onViewAll: () => _goToTaskList(
                        context: context,
                        status: 'in_progress',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  void _goToTaskList({
    required BuildContext context,
    required String status,
  }) {
    context.push('${Routes.taskList}/$status');
  }
}
