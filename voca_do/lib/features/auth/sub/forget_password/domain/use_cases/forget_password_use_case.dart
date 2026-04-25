import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/auth/sub/forget_password/domain/entities/forget_password_entity.dart';
import 'package:voca_do/features/auth/sub/forget_password/domain/repositories/forget_password_repository_domain.dart';


@lazySingleton
class ForgetPasswordUseCase {
  final ForgetPasswordRepositoryDomain _repositoryData;

  ForgetPasswordUseCase(this._repositoryData);

   Future<Result<ForgetPasswordEntity, Failure>> getForgetPassword() async {
    return _repositoryData.getForgetPassword();
  }
}
