import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/domain/entities/admin_home_screen_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_home_screen_model.freezed.dart';
part 'admin_home_screen_model.g.dart';

@freezed
abstract class AdminHomeScreenModel with _$AdminHomeScreenModel {
  const factory AdminHomeScreenModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AdminHomeScreenModel;

  factory AdminHomeScreenModel.fromJson(Map<String, Object?> json) => _$AdminHomeScreenModelFromJson(json);
}



extension AdminHomeScreenModelMapper on AdminHomeScreenModel {
  AdminHomeScreenEntity toEntity() {
    return AdminHomeScreenEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
