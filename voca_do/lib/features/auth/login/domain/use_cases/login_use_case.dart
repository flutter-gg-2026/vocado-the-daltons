import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/constants/app_enums.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/auth/login/domain/repositories/login_repository_domain.dart';

@lazySingleton
class LoginUseCase {
  final LoginRepositoryDomain _repositoryData;

  LoginUseCase(this._repositoryData);

  Future<Result<UserRole, Failure>> getLogin({
    required String email,
    required String password,
  }) async {
    return _repositoryData.getLogin(email: email, password: password);
  }
}
