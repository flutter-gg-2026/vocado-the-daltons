import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_cubit.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_state.dart';

class TeamFeatureScreen extends StatelessWidget {
  const TeamFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Team',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          child: BlocBuilder<TeamCubit, TeamState>(
            builder: (context, state) {
              if (state is TeamLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TeamSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: state.team.length,
                  itemBuilder: (context, index) {
                    final user = state.team[index];
                    return Container(
                      width: 220,
                      margin: const EdgeInsets.only(
                        right: 20,
                        bottom: 40,
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFA583C0), Color(0xFF8E6EB3)],
                        ),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 100,
                            color: Color(0xFF4A148C),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            user.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "App Dev",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF4DB6AC),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              user.role,
                              style: const TextStyle(
                                color: Color(0xFF4DB6AC),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              if (state is TeamErrorState) {
                return Center(child: Text(state.message));
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}