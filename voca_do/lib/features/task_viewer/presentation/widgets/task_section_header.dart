import 'package:flutter/material.dart';

class TaskSectionHeader extends StatelessWidget {
  final String title;
  final String count;

  const TaskSectionHeader({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.black,
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const Text(
          'View all',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}