import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

class LateTaskCard extends StatelessWidget {
  final TaskViewerEntity task;

  const LateTaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 145,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Late',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.error,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            task.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.flag, color: colorScheme.error, size: 18),
              const SizedBox(width: 6),
              Text(
                task.dueDate,
                style: textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Icon(
            Icons.check_box_outline_blank,
            size: 18,
            color: colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
