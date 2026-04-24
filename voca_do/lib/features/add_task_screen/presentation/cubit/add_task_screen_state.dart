import 'package:equatable/equatable.dart';

abstract class AddTaskScreenState extends Equatable {
  const AddTaskScreenState();

  @override
  List<Object?> get props => [];
}

class AddTaskScreenInitialState extends AddTaskScreenState {}
class AddTaskScreenSuccessState extends AddTaskScreenState {}

class AddTaskScreenErrorState extends AddTaskScreenState {
  final String message;
  const AddTaskScreenErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

