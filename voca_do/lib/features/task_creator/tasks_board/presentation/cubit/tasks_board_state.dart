import 'package:equatable/equatable.dart';
import 'package:voca_do/features/task_creator/tasks_board/domain/entities/tasks_board_entity.dart';

abstract class TasksBoardState extends Equatable {
  const TasksBoardState();

  @override
  List<Object?> get props => [];
}

class TasksBoardInitialState extends TasksBoardState {}

class TeamLoadingState extends TasksBoardState {}

class TasksBoardSuccessState extends TasksBoardState {
  final List<TasksBoardEntity> team;
  const TasksBoardSuccessState(this.team);

  @override
  List<Object?> get props => [team];
}

class TasksBoardErrorState extends TasksBoardState {
  final String message;
  const TasksBoardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
