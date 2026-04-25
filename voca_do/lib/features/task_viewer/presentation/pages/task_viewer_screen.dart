import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_horizontal_section.dart';

class TaskViewerScreen extends StatefulWidget {
  const TaskViewerScreen({super.key});

  @override
  State<TaskViewerScreen> createState() => _TaskViewerScreenState();
}

class _TaskViewerScreenState extends State<TaskViewerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskViewerCubit>().getUserTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      body: SafeArea(
        child: BlocBuilder<TaskViewerCubit, TaskViewerState>(
          builder: (context, state) {
            if (state is TaskViewerLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is TaskViewerErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is TaskViewerSuccessState) {
              final tasks = state.tasks;

              final newTasks = _getNewTasks(tasks);
              final lateTasks = _getLateTasks(tasks);
              final inProgressTasks = _getInProgressTasks(tasks);

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Hello,',
                          children: [
                            TextSpan(
                              text: 'USER',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    const SizedBox(height: 28),

                    TaskHorizontalSection(
                      title: 'New',
                      tasks: newTasks,
                      type: TaskSectionType.newTask,
                    ),

                    const SizedBox(height: 24),

                    TaskHorizontalSection(
                      title: 'Late',
                      tasks: lateTasks,
                      type: TaskSectionType.late,
                    ),

                    const SizedBox(height: 24),

                    TaskHorizontalSection(
                      title: 'In Progress',
                      tasks: inProgressTasks,
                      type: TaskSectionType.inProgress,
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  List<TaskViewerEntity> _getNewTasks(List<TaskViewerEntity> tasks) {
    return tasks.where((task) {
      return task.status.toLowerCase() == 'new';
    }).toList();
  }

  List<TaskViewerEntity> _getInProgressTasks(List<TaskViewerEntity> tasks) {
    return tasks.where((task) {
      return task.status.toLowerCase() == 'in_progress';
    }).toList();
  }

  List<TaskViewerEntity> _getLateTasks(List<TaskViewerEntity> tasks) {
    return tasks.where((task) {
      final dueDate = DateTime.parse(task.dueDate);
      final today = DateTime.now();

      return dueDate.isBefore(today) &&
          task.status.toLowerCase() != 'completed';
    }).toList();
  }
}