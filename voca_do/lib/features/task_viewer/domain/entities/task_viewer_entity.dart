import 'package:equatable/equatable.dart';

class TaskViewerEntity extends Equatable {
  final String id;
  final String title;
  final String assigneeId;
  final String dueDate;
  final String status;
  final String createdBy;
  final String createdAt;

  const TaskViewerEntity({
    required this.id,
    required this.title,
    required this.assigneeId,
    required this.dueDate,
    required this.status,
    required this.createdBy,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        assigneeId,
        dueDate,
        status,
        createdBy,
        createdAt,
      ];
}