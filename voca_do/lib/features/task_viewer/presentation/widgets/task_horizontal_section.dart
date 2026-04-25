import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_card.dart';

enum TaskSectionType {
  newTask,
  late,
  inProgress,
}

class TaskHorizontalSection extends StatelessWidget {
  final String title;
  final List<TaskViewerEntity> tasks;
  final TaskSectionType type;
  final VoidCallback? onViewAll;

  const TaskHorizontalSection({
    super.key,
    required this.title,
    required this.tasks,
    required this.type,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final badgeColor = _getBadgeColor();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${tasks.length} $title',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(width: 6),
            if (type != TaskSectionType.newTask)
              CircleAvatar(
                radius: 13,
                backgroundColor: badgeColor,
                child: Text(
                  tasks.length.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

        const Spacer(),

GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: onViewAll,
  child: const Padding(
    padding: EdgeInsets.all(12),
    child: Text(
      'View all',
      style: TextStyle(
        fontSize: 12,
        color: Colors.black87,
      ),
    ),
  ),
),
          ],
        ),

        const SizedBox(height: 12),
        if (tasks.isEmpty)
          Container(
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              'No tasks',
              style: TextStyle(color: Colors.grey),
            ),
          )
        else
          SizedBox(
            height: _getHeight(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tasks.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return TaskCard(
                  task: tasks[index],
                  type: type,
                );
              },
            ),
          ),
      ],
    );
  }

  Color _getBadgeColor() {
    if (type == TaskSectionType.late) {
      return const Color(0xffF26D6D); 
    }

    if (type == TaskSectionType.inProgress) {
      return const Color(0xffF3DE73);
    }

    return Colors.transparent;
  }

  double _getHeight() {
    if (type == TaskSectionType.inProgress) {
      return 95;
    }

    if (type == TaskSectionType.late) {
      return 145;
    }

    return 130; 
  }
}