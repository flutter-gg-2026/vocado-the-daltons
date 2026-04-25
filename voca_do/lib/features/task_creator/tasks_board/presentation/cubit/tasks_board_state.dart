import 'package:equatable/equatable.dart';

abstract class TasksBoardState extends Equatable {
  const TasksBoardState();

  @override
  List<Object?> get props => [];
}

class TasksBoardInitialState extends TasksBoardState {}
class TasksBoardSuccessState extends TasksBoardState {}

class TasksBoardErrorState extends TasksBoardState {
  final String message;
  const TasksBoardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

