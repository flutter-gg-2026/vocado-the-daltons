import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/entities/add_task_screen_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_task_screen_model.freezed.dart';
part 'add_task_screen_model.g.dart';

@freezed
abstract class AddTaskScreenModel with _$AddTaskScreenModel {
  const factory AddTaskScreenModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AddTaskScreenModel;

  factory AddTaskScreenModel.fromJson(Map<String, Object?> json) => _$AddTaskScreenModelFromJson(json);
}



extension AddTaskScreenModelMapper on AddTaskScreenModel {
  AddTaskScreenEntity toEntity() {
    return AddTaskScreenEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
