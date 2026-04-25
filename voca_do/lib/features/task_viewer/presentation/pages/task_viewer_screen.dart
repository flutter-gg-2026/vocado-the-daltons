import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_horizontal_section.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_grid_section.dart';
import 'package:voca_do/features/task_viewer/presentation/widgets/task_vertical_section.dart';

class TaskViewerFeatureScreen extends StatefulWidget {
  const TaskViewerFeatureScreen({super.key});

  @override
  State<TaskViewerFeatureScreen> createState() =>
      _TaskViewerFeatureScreenState();
}

class _TaskViewerFeatureScreenState
    extends State<TaskViewerFeatureScreen> {
  @override
  void initState() {
    super.initState();

    context.read<TaskViewerCubit>().getTaskViewerMethod(
          '76ce4e3a-273d-4ace-afda-5af555288291',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task-index'),
      ),
      body: BlocBuilder<TaskViewerCubit, TaskViewerState>(
        builder: (context, state) {
       
          if (state is TaskViewerLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TaskViewerErrorState) {
            return Center(
              child: Text(state.message),
            );
          }

        
          if (state is TaskViewerSuccessState) {
            final tasks = state.tasks;

            final newTasks = tasks.where((task) {
              return task.status == 'new';
            }).toList();

        
            final inProgressTasks = tasks.where((task) {
              return task.status == 'in_progress';
            }).toList();

            final lateTasks = tasks.where((task) {
              final dueDate = DateTime.tryParse(task.dueDate);

              if (dueDate == null) {
                return false;
              }

              return dueDate.isBefore(DateTime.now()) &&
                  task.status != 'done';
            }).toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello, user',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 24),

                  TaskHorizontalSection(
                    title: 'New',
                    tasks: newTasks,
                  ),

                  const SizedBox(height: 24),

               
                  TaskGridSection(
                    title: 'Late',
                    tasks: lateTasks,
                  ),

                  const SizedBox(height: 24),

                
                  TaskVerticalSection(
                    title: 'In Progress',
                    tasks: inProgressTasks,
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}