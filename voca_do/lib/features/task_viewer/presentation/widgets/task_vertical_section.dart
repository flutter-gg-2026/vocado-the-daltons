import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/in_progress_task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_section_header.dart';

class TaskVerticalSection extends StatelessWidget {
  final String title;
  final String? count;
  final Color? countColor;
  final List<TaskViewerEntity> tasks;
  final VoidCallback? onViewAll;

  const TaskVerticalSection({
    super.key,
    required this.title,
    required this.tasks,
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
        ...tasks.map(
          (task) => InProgressTaskCard(task: task),
        ),
      ],
    );
  }
}