import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_details_item.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskViewerEntity task;

  const TaskDetailsScreen({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            TaskDetailsItem(
              title: 'Status',
              value: task.status,
            ),
            const SizedBox(height: 16),
            TaskDetailsItem(
              title: 'Due Date',
              value: task.dueDate,
            ),
            const SizedBox(height: 16),
            TaskDetailsItem(
              title: 'Assignee ID',
              value: task.assigneeId,
            ),
          ],
        ),
      ),
    );
  }
}
