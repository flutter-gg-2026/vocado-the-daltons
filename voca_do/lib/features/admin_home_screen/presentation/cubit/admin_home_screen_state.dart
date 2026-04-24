import 'package:equatable/equatable.dart';

abstract class AdminHomeScreenState extends Equatable {
  const AdminHomeScreenState();

  @override
  List<Object?> get props => [];
}

class AdminHomeScreenInitialState extends AdminHomeScreenState {}

// ==============================================================

class AdminHomeScreenSuccessState extends AdminHomeScreenState {
  const AdminHomeScreenSuccessState();
}

// ==============================================================

class AdminHomeScreenErrorState extends AdminHomeScreenState {
  final String message;
  const AdminHomeScreenErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

// ==============================================================
