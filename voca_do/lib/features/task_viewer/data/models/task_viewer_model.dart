import 'package:json_annotation/json_annotation.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

part 'task_viewer_model.g.dart';

@JsonSerializable()
class TaskViewerModel {
  final String id;
  final String title;

  @JsonKey(name: 'assignee_id')
  final String assigneeId;

  @JsonKey(name: 'due_date')
  final String dueDate;

  final String status;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'created_at')
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

  factory TaskViewerModel.fromJson(Map<String, dynamic> json) =>
      _$TaskViewerModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskViewerModelToJson(this);

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