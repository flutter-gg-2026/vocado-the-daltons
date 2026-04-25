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
    return Container(
      width: 190,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffB394CC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(
                Icons.flag,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                task.dueDate,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(  56),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'select a task status',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}