import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_cubit.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_state.dart';

class TeamFeatureScreen extends StatelessWidget {
  const TeamFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<TeamCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Team Feature Screen')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TeamCubit, TeamState>(
              builder: (context, state) {
                if (state is TeamLoadingState) {
                  return CircularProgressIndicator();
                }

                if (state is TeamSuccessState) {
                  return ListView.builder(
                    itemCount: state.team.length,
                    itemBuilder: (context, index) {
                      final user = state.team[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.role),
                      );
                    },
                  );
                }

                if (state is TeamErrorState) {
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
