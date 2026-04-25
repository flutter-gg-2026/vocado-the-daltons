import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_do/core/navigation/routers.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

class TaskCard extends StatelessWidget {
  final TaskViewerEntity task;

  const TaskCard({
    super.key,
    required this.task,
  });

  bool get isLate {
    final date = DateTime.tryParse(task.dueDate);
    if (date == null) return false;

    return date.isBefore(DateTime.now()) && task.status != 'done';
  }

  Color get cardColor {
    if (task.status == 'new') return const Color(0xffB493CC);
    if (task.status == 'in_progress') return const Color(0xffE9F6F6);
    if (isLate) return const Color(0xffEEEAF2);
    return const Color(0xffF5F5F5);
  }

  String get label {
    if (isLate) return 'Late';
    if (task.status == 'new') return 'New';
    if (task.status == 'in_progress') return 'In Progress';
    return task.status;
  }

  Color get labelColor {
    if (isLate) return const Color(0xffFF5B6E);
    return Colors.black;
  }

  Color get flagColor {
    if (isLate) return const Color(0xffFF2F4F);
    return const Color(0xff7B7B7B);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routes.taskDetails,
          extra: task,
        );
      },
      child: Container(
        width: 156,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: labelColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              task.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  Icons.flag,
                  color: flagColor,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  task.dueDate,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}