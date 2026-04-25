import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_section_header.dart';

class TaskVerticalSection extends StatelessWidget {
  final String title;
  final List<TaskViewerEntity> tasks;

  const TaskVerticalSection({
    super.key,
    required this.title,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskSectionHeader(
          title: title,
          count: tasks.length.toString(),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return TaskCard(
              task: tasks[index],
            );
          },
        ),
      ],
    );
  }
}