// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewTaskModel _$NewTaskModelFromJson(Map<String, dynamic> json) =>
    _NewTaskModel(
      task: json['task'] as String,
      assignee: json['assignee'] as String,
      dueDate: DateTime.parse(json['due_date'] as String),
    );

Map<String, dynamic> _$NewTaskModelToJson(_NewTaskModel instance) =>
    <String, dynamic>{
      'task': instance.task,
      'assignee': instance.assignee,
      'due_date': instance.dueDate.toIso8601String(),
    };
