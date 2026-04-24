import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_viewer_model.freezed.dart';
part 'task_viewer_model.g.dart';

@freezed
abstract class TaskViewerModel with _$TaskViewerModel {
  const factory TaskViewerModel({
    required String id,
    required String title,
    @JsonKey(name: 'assignee_id') required String assigneeId,
    @JsonKey(name: 'due_date') required String dueDate,
    required String status,
  }) = _TaskViewerModel;

  factory TaskViewerModel.fromJson(Map<String, dynamic> json) =>
      _$TaskViewerModelFromJson(json);
}

extension TaskViewerMapper on TaskViewerModel {
  TaskViewerEntity toEntity() {
    return TaskViewerEntity(
      id: id,
      title: title,
      assigneeId: assigneeId,
      dueDate: dueDate,
      status: status,
    );
  }
}