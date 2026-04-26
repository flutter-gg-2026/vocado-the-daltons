import 'package:flutter/material.dart';

class TaskSectionHeader extends StatelessWidget {
  final String title;
  final String? count;
  final Color? countColor;
  final VoidCallback? onViewAll;

  const TaskSectionHeader({
    super.key,
    required this.title,
    this.count,
    this.countColor,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (count != null) ...[
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 14,
                backgroundColor:
                    countColor ?? colorScheme.surfaceContainerHighest,
                child: Text(
                  count!,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ],
        ),
        GestureDetector(
          onTap: onViewAll,
          child: Text(
            'View all',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
