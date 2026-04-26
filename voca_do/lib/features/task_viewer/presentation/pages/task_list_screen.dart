import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskListScreen extends StatelessWidget {
  final String status;

  const TaskListScreen({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: BlocBuilder<TaskViewerCubit, TaskViewerState>(
            builder: (context, state) {
              if (state is TaskViewerLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TaskViewerError) {
                return Center(child: Text(state.message));
              }

              if (state is TaskViewerSuccess) {
                final tasks = context.read<TaskViewerCubit>().getTasksByStatus(status);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${_getStatusTitle(status)} Task need to done',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: tasks.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          return TaskListCard(task: tasks[index]);
                        },
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  String _getStatusTitle(String status) {
    switch (status) {
      case 'new':
        return 'New';
      case 'late':
        return 'Late';
      case 'in_progress':
        return 'In Progress';
      default:
        return 'Tasks';
    }
  }
}

class TaskListCard extends StatelessWidget {
  final TaskViewerEntity task;

  const TaskListCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = task.status.toLowerCase() == 'completed';

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffFCFAFF),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.purple,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Task',
                  style: TextStyle(
                    color: Color(0xffFF5C6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.flag, size: 20, color: Colors.red),
                    const SizedBox(width: 6),
                    Text(
                      task.dueDate,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: isCompleted,
            activeColor: const Color(0xff1B4E77),
            onChanged: isCompleted
                ? null
                : (_) {
                    context.read<TaskViewerCubit>().completeTask(taskId: task.id);
                  },
          ),
        ],
      ),
    );
  }
}
