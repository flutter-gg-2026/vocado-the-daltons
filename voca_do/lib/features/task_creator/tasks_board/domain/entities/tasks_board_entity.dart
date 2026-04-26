import 'package:equatable/equatable.dart';

class TasksBoardEntity extends Equatable {
  final String id;
  final String task;
  final String status;

  const TasksBoardEntity({
    required this.id,
    required this.task,
    required this.status,
  });

  @override
  List<Object?> get props => [status, task, id];
}
