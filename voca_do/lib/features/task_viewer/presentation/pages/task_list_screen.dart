import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: BlocBuilder<TaskViewerCubit, TaskViewerState>(
            builder: (context, state) {
              if (state is TaskViewerLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TaskViewerError) {
                return Center(
                  child: Text(
                    state.message,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                );
              }

              if (state is TaskViewerSuccess) {
                final tasks = context.read<TaskViewerCubit>().getTasksByStatus(
                      status,
                    );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      onPressed: () => context.pop(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${_getStatusTitle(status)} Task need to done',
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: tasks.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 14),
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.08),
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
                Text(
                  'Task',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  task.title,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.flag, size: 20, color: colorScheme.error),
                    const SizedBox(width: 6),
                    Text(
                      task.dueDate,
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: isCompleted,
            activeColor: colorScheme.primary,
            onChanged: isCompleted
                ? null
                : (_) {
                    context.read<TaskViewerCubit>().completeTask(
                          taskId: task.id,
                        );
                  },
          ),
        ],
      ),
    );
  }
}
