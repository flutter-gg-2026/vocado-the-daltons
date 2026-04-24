// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskViewerModel _$TaskViewerModelFromJson(Map<String, dynamic> json) =>
    _TaskViewerModel(
      id: json['id'] as String,
      title: json['title'] as String,
      assigneeId: json['assignee_id'] as String,
      dueDate: json['due_date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TaskViewerModelToJson(_TaskViewerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'assignee_id': instance.assigneeId,
      'due_date': instance.dueDate,
      'status': instance.status,
    };
