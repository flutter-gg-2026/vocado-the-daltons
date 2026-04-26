import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_cubit.dart';

class TasksBoardFeatureScreen extends StatelessWidget {
  const TasksBoardFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<TasksBoardCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('TasksBoard Feature Screen'),),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
