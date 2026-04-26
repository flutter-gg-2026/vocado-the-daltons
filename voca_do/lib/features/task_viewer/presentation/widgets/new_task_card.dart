import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

class NewTaskCard extends StatelessWidget {
  final TaskViewerEntity task;

  const NewTaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 185,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.flag,
                size: 18,
                color: colorScheme.onPrimary,
              ),
              const SizedBox(width: 6),
              Text(
                task.dueDate,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'select a task status',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
