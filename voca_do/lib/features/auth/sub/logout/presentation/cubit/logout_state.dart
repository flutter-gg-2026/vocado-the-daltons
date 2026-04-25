import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object?> get props => [];
}

class LogoutInitialState extends LogoutState {}

class LogoutLoadingState extends LogoutState {}

class LogoutSuccessState extends LogoutState {}

class LogoutErrorState extends LogoutState {
  final String message;
  const LogoutErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
