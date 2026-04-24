// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddTaskScreenModel _$AddTaskScreenModelFromJson(Map<String, dynamic> json) =>
    _AddTaskScreenModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$AddTaskScreenModelToJson(_AddTaskScreenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
