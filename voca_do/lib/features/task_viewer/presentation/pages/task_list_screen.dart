import 'package:flutter/material.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

class TaskListScreen extends StatelessWidget {
  final String title;
  final List<TaskViewerEntity> tasks;

  const TaskListScreen({
    super.key,
    required this.title,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Hello,',
                    children: [
                      TextSpan(
                        text: 'USER',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  style: TextStyle(fontSize: 15),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Text(
                    '${tasks.length} $title',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Task need to done',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Expanded(
                child: ListView.separated(
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    return _TaskListCard(task: tasks[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskListCard extends StatelessWidget {
  final TaskViewerEntity task;

  const _TaskListCard({
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB99AD1).withOpacity(0.10),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.flag,
            color: Color(0xffFF2F4F),
            size: 28,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Task 02',
                  style: TextStyle(
                    color: Color(0xffF35D78),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  task.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 13,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.dueDate,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Icon(
            Icons.check_box_outline_blank,
            color: Color(0xff0E3A5B),
            size: 20,
          ),
        ],
      ),
    );
  }
}