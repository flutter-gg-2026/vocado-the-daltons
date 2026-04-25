// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_home_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminHomeScreenModel _$AdminHomeScreenModelFromJson(
  Map<String, dynamic> json,
) => _AdminHomeScreenModel(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
);

Map<String, dynamic> _$AdminHomeScreenModelToJson(
  _AdminHomeScreenModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
