import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_cubit.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_state.dart';

class TasksBoardFeatureScreen extends StatelessWidget {
  const TasksBoardFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<TasksBoardCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('TasksBoard Feature Screen'),),
      body: Column(children: [
           Expanded(
            child: BlocBuilder<TasksBoardCubit, TasksBoardState>(
              builder: (context, state) {
                if (state is TeamLoadingState) {
                  return CircularProgressIndicator();
                }

                if (state is TasksBoardSuccessState) {
                  return ListView.builder(
                    itemCount: state.team.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.team[index].task),
                        subtitle: Text(state.team[index].status),
                      );
                    },
                  );
                }

                if (state is TasksBoardErrorState) {
                  return Text(state.message);
                }

                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
