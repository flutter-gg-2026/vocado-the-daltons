// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksBoardModel _$TasksBoardModelFromJson(Map<String, dynamic> json) =>
    _TasksBoardModel(
      id: json['id'] as String,
      task: json['task'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TasksBoardModelToJson(_TasksBoardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'status': instance.status,
    };
