import 'package:voca_do/features/auth/sub/forget_password/domain/entities/forget_password_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password_model.freezed.dart';
part 'forget_password_model.g.dart';

@freezed
abstract class ForgetPasswordModel with _$ForgetPasswordModel {
  const factory ForgetPasswordModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _ForgetPasswordModel;

  factory ForgetPasswordModel.fromJson(Map<String, Object?> json) => _$ForgetPasswordModelFromJson(json);
}



extension ForgetPasswordModelMapper on ForgetPasswordModel {
  ForgetPasswordEntity toEntity() {
    return ForgetPasswordEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
