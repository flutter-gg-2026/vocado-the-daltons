
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_horizontal_section.dart';

class DefaultTaskCard extends StatelessWidget {
  final TaskViewerEntity task;
  final TaskSectionType type;

  const DefaultTaskCard({
    required this.task,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final isLate = type == TaskSectionType.late;

    return Container(
width: isLate ? 135 : 170,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isLate ? const Color(0xffECEAF4) : const Color(0xffB99AD1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    if (isLate)
      const Text(
        'Late',
        style: TextStyle(
          color: Color(0xffF35D78),
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),

    Expanded(
      child: Text(
        task.title,
        maxLines: isLate ? 4 : 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w900,
          height: 1.1,
        ),
      ),
    ),

    const SizedBox(height: 6),

    Row(
      children: [
        Icon(
          Icons.flag,
          color: isLate ? Colors.redAccent : Colors.grey,
          size: 16,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            task.dueDate,
            style: const TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),

    const SizedBox(height: 6),

    if (isLate)
      const Icon(
        Icons.check_box_outline_blank,
        size: 16,
        color: Color(0xff0E3A5B),
      )
    else
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'select a task status',
              style: TextStyle(
                fontSize: 8,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              size: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
  ],
),
    );
  }
}
