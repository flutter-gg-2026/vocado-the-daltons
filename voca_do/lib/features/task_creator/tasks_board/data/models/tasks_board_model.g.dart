// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksBoardModel _$TasksBoardModelFromJson(Map<String, dynamic> json) =>
    _TasksBoardModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$TasksBoardModelToJson(_TasksBoardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
