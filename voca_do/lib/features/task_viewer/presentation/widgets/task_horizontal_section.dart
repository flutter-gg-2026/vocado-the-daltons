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
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tasks.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              return TaskCard(
                task: tasks[index],
              );
            },
          ),
        ),
      ],
    );
  }
}