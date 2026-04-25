// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskViewerModel _$TaskViewerModelFromJson(Map<String, dynamic> json) =>
    TaskViewerModel(
      id: json['id'] as String,
      title: json['title'] as String,
      assigneeId: json['assignee_id'] as String,
      dueDate: json['due_date'] as String,
      status: json['status'] as String,
      createdBy: json['created_by'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$TaskViewerModelToJson(TaskViewerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'assignee_id': instance.assigneeId,
      'due_date': instance.dueDate,
      'status': instance.status,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
    };
