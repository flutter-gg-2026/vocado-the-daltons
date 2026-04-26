import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';

class TaskListScreen extends StatelessWidget {
  final String title;
  final String? assigneeId;
  final List<TaskViewerEntity> tasks;

  const TaskListScreen({
    super.key,
    required this.title,
    this.assigneeId,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                onPressed: () =>  context.pop(),
                // onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const SizedBox(height: 20),
              Text(
                '$title Task need to done',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    return TaskListCard(
                      task: tasks[index],
                      assigneeId: assigneeId!,
                    );
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

class TaskListCard extends StatefulWidget {
  final TaskViewerEntity task;
  final String assigneeId;

  const TaskListCard({
    super.key,
    required this.task,
    required this.assigneeId,
  });

  @override
  State<TaskListCard> createState() => _TaskListCardState();
}

class _TaskListCardState extends State<TaskListCard> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.task.status.toLowerCase() == 'completed';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffFCFAFF),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.07),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Task 02',
                  style: TextStyle(
                    color: Color(0xffFF5C6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.task.title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    decoration:
                        isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.flag, size: 20, color: Colors.red),
                    const SizedBox(width: 6),
                    Text(
                      widget.task.dueDate,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: isCompleted,
            activeColor: const Color(0xff1B4E77),
            onChanged: (value) {
              setState(() {
                isCompleted = value ?? false;
              });

              if (isCompleted) {
                context.read<TaskViewerCubit>().completeTask(
                      taskId: widget.task.id,
                      assigneeId: widget.assigneeId,
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}