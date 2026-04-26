import 'package:equatable/equatable.dart';
import 'package:voca_do/features/task_creator/team/domain/entities/team_entity.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object?> get props => [];
}

class TeamInitialState extends TeamState {}
class TeamLoadingState extends TeamState {}


class TeamSuccessState extends TeamState {
  final List<TeamEntity> team;
  const TeamSuccessState(this.team);

  @override
  List<Object?> get props => [team];
}

class TeamErrorState extends TeamState {
  final String message;
  const TeamErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
