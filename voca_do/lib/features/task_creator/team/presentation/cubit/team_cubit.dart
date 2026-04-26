import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/team/domain/use_cases/team_use_case.dart';
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final TeamUseCase _teamUseCase;

  TeamCubit(this._teamUseCase) : super(TeamInitialState());

  Future<void> getTeamMethod() async {
    final result = await _teamUseCase.getTeam();
    result.when(
      (success) {
        emit(TeamSuccessState(success));
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }
}
