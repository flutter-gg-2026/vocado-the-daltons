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
    return Container(
      width: 145,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffEFECF5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Late',
            style: TextStyle(
              color: Color(0xffFF5C6C),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            task.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.flag, color: Colors.red, size: 18),
              const SizedBox(width: 6),
              Text(
                task.dueDate,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Icon(Icons.check_box_outline_blank, size: 18),
        ],
      ),
    );
  }
}