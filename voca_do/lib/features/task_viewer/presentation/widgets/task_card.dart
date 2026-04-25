import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/default_task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/in_progress_task_card.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_horizontal_section.dart';

class TaskCard extends StatelessWidget {
  final TaskViewerEntity task;
  final TaskSectionType type;

  const TaskCard({
    super.key,
    required this.task,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    if (type == TaskSectionType.inProgress) {
      return InProgressTaskCard(task: task);
    }

    return DefaultTaskCard(
      task: task,
      type: type,
    );
  }
}
