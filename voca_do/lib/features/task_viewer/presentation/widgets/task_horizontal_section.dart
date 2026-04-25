import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/late_task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/new_task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_section_header.dart';

enum TaskHorizontalSectionType {
  newTask,
  late,
}

class TaskHorizontalSection extends StatelessWidget {
  final String title;
  final String? count;
  final Color? countColor;
  final List<TaskViewerEntity> tasks;
  final TaskHorizontalSectionType type;
  final VoidCallback? onViewAll;

  const TaskHorizontalSection({
    super.key,
    required this.title,
    required this.tasks,
    required this.type,
    this.count,
    this.countColor,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskSectionHeader(
          title: title,
          count: count,
          countColor: countColor,
          onViewAll: onViewAll,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: type == TaskHorizontalSectionType.newTask ? 150 : 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tasks.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final task = tasks[index];

              if (type == TaskHorizontalSectionType.newTask) {
                return NewTaskCard(task: task);
              }

              return LateTaskCard(task: task);
            },
          ),
        ),
      ],
    );
  }
}