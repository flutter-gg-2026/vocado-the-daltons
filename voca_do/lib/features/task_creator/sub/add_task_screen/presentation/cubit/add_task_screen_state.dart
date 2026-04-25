import 'package:equatable/equatable.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/entities/new_task_entity.dart';

abstract class AddTaskScreenState extends Equatable {
  const AddTaskScreenState();

  @override
  List<Object?> get props => [];
}
// ============================================================

class AddTaskScreenInitialState extends AddTaskScreenState {}

// ============================================================

class AddTaskScreenLoadingState extends AddTaskScreenState {}

// ============================================================

class AddTaskScreenSuccessState extends AddTaskScreenState {
  final NewTaskEntity taskEntity;
  const AddTaskScreenSuccessState({required this.taskEntity});

  @override
  List<Object?> get props => [taskEntity];
}

// ============================================================

class AddTaskScreenErrorState extends AddTaskScreenState {
  final String message;
  const AddTaskScreenErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
