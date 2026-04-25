import 'package:equatable/equatable.dart';

class NewTaskEntity extends Equatable {
  final String task;
  final String assignee;
  final DateTime dueDate;
  const NewTaskEntity({
    required this.task,
    required this.assignee,
    required this.dueDate,
  });

  // ==============================================================

  @override
  List<Object?> get props => [task, assignee, dueDate];
}
