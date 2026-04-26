import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_do/core/navigation/routers.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_horizontal_section.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_vertical_section.dart';

class TaskIndexScreen extends StatefulWidget {
  final String assigneeId;
  final String userName;

  const TaskIndexScreen({
    super.key,
    required this.assigneeId,
    required this.userName,
  });

  @override
  State<TaskIndexScreen> createState() => _TaskIndexScreenState();
}

class _TaskIndexScreenState extends State<TaskIndexScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskViewerCubit>().getUserTasks(widget.assigneeId);
  }

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
            final newTasks = state.tasks
                .where((task) => task.status.toLowerCase() == 'new')
                .toList();

            final lateTasks = state.tasks
                .where((task) => task.status.toLowerCase() == 'late')
                .toList();

            final inProgressTasks = state.tasks
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
                      'Hello,${widget.userName}',
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
                      onViewAll: () {
                        _goToTaskList(title: 'New Tasks', tasks: newTasks);
                      },
                    ),
                    const SizedBox(height: 26),
                    TaskHorizontalSection(
                      title: 'Late',
                      count: lateTasks.length.toString(),
                      countColor: const Color(0xffFF6F79),
                      tasks: lateTasks,
                      type: TaskHorizontalSectionType.late,
                      onViewAll: () {
                        _goToTaskList(title: 'Late', tasks: lateTasks);
                      },
                    ),
                    const SizedBox(height: 26),
                    TaskVerticalSection(
                      title: 'In Progress',
                      count: inProgressTasks.length.toString(),
                      countColor: const Color(0xffFFE37A),
                      tasks: inProgressTasks,
                      onViewAll: () {
                        _goToTaskList(
                          title: 'In Progress',
                          tasks: inProgressTasks,
                        );
                      },
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
  required String title,
  required List<TaskViewerEntity> tasks,
}) {
  context.go(
    Routes.taskList,
    extra: {
      'title': title,
      'tasks': tasks,
      'assigneeId': widget.assigneeId.isNotEmpty ? widget.assigneeId : null,
    },
  );
}
  // void _goToTaskList({
  //   required String title,
  //   required List<TaskViewerEntity> tasks,
  // }) {
  //   context.push(
  //     Routes.taskList,
  //     extra: {'title': title, 'tasks': tasks, 'assigneeId': widget.assigneeId},
  //   );
  // }
}
