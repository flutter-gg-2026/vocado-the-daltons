import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

class TaskViewerModel {
  final String id;
  final String title;
  final String assigneeId;
  final String dueDate;
  final String status;
  final String createdBy;
  final String createdAt;

  TaskViewerModel({
    required this.id,
    required this.title,
    required this.assigneeId,
    required this.dueDate,
    required this.status,
    required this.createdBy,
    required this.createdAt,
  });

  factory TaskViewerModel.fromJson(Map<String, dynamic> json) {
    return TaskViewerModel(
      id: json['id']?.toString() ?? '',
      title: json['task']?.toString() ?? 'No title',
      assigneeId: json['assignee_id']?.toString() ?? '',
      dueDate: json['due_date']?.toString() ?? '',
      status: json['status']?.toString() ?? 'new',
      createdBy: json['created_by']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
    );
  }

  TaskViewerEntity toEntity() {
    return TaskViewerEntity(
      id: id,
      title: title,
      assigneeId: assigneeId,
      dueDate: dueDate,
      status: status,
      createdBy: createdBy,
      createdAt: createdAt,
    );
  }
}