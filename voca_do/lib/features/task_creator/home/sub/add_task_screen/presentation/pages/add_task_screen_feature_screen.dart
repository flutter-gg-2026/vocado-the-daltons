import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/presentation/cubit/add_task_screen_cubit.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/presentation/cubit/add_task_screen_state.dart';
import 'package:voca_do/features/task_creator/home/sub/audio_feature/presentation/cubit/audio_feature_cubit.dart';
import 'package:voca_do/features/task_creator/home/sub/audio_feature/presentation/cubit/audio_feature_state.dart';
import 'package:voca_do/features/task_creator/home/sub/audio_feature/presentation/pages/audio_feature_feature_widget.dart';

class AddTaskScreenFeatureScreen extends StatelessWidget {
  const AddTaskScreenFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddTaskScreenCubit>();

    return BlocProvider(
      create: (context) => AudioFeatureCubit(GetIt.I.get()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Task',
            style: TextStyle(fontWeight: .bold, fontSize: 24),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AudioFeatureFeatureWidget(),

              //! I had t search for this
              BlocConsumer<AddTaskScreenCubit, AddTaskScreenState>(
                listener: (context, state) {
                  if (state is AddTaskScreenSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task added successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state is AddTaskScreenErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },

                // ====================================================
                // ====================================================
                builder: (context, state) {
                  if (state is AddTaskScreenLoadingState) {
                    return const CircularProgressIndicator();
                  }

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      final audioState = context
                          .read<AudioFeatureCubit>()
                          .state;

                      String taskToSubmit = '';

                      if (audioState is AudioFeatureTranscriptionSuccessState) {
                        taskToSubmit = audioState.text;
                      }

                      if (taskToSubmit.isNotEmpty) {
                        cubit.getAddTaskMethod(task: taskToSubmit);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please record a task first!'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Approve Task',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
