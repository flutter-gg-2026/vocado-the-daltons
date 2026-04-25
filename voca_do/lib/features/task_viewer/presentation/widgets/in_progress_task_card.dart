import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

class InProgressTaskCard extends StatelessWidget {
  final TaskViewerEntity task;

  const InProgressTaskCard({
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffE5F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.flag,
            color: Colors.grey,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              task.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Icon(
            Icons.check_box_outline_blank,
            size: 18,
            color: Color(0xff0E3A5B),
          ),
        ],
      ),
    );
  }
}