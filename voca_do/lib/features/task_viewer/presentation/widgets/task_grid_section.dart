import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_section_header.dart';

class TaskGridSection extends StatelessWidget {
  final String title;
  final List<TaskViewerEntity> tasks;

  const TaskGridSection({
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
       SizedBox(
  width: double.infinity,
  child: GridView.builder(
         shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            return TaskCard(
              task: tasks[index],
            );
          },
        ),
       )
      ],
    );
  }
}