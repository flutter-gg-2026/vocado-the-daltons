import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/add_task_screen/presentation/cubit/add_task_screen_cubit.dart';
import 'package:voca_do/features/sub/audio_feature/presentation/pages/audio_feature_feature_widget.dart';

class AddTaskScreenFeatureScreen extends StatelessWidget {
  const AddTaskScreenFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<AddTaskScreenCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            AudioFeatureFeatureWidget(),
            ElevatedButton(
              onPressed: () {
                //TODO: add to database
              },
              child: Text('Approve Task'),
            ),
          ],
        ),
      ),
    );
  }
}
