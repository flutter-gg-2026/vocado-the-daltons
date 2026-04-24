import 'package:equatable/equatable.dart';

class TaskViewerEntity extends Equatable {
  final String id;
  final String title ;
  final String assigneeId;
  final String dueDate;
  final String status;

  const TaskViewerEntity({
    required this.id,
    required this.title,
    required this.assigneeId,
    required this.dueDate,
    required this.status,
  });

  @override
  List<Object?> get props => [title, assigneeId, dueDate, status, id];
}
