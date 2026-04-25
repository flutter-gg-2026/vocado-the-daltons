import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_section_header.dart';

class TaskHorizontalSection extends StatelessWidget {
  final String title;
  final List<TaskViewerEntity> tasks;

  const TaskHorizontalSection({
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

        if (tasks.isEmpty)
          const Text(
            'No tasks',
            style: TextStyle(color: Colors.grey),
          )
        else
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tasks.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return TaskCard(task: tasks[index]);
              },
            ),
          ),
      ],
    );
  }
}