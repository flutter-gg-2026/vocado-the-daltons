import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/auth/login/domain/entities/login_entity.dart';
import 'package:voca_do/features/auth/login/domain/repositories/login_repository_domain.dart';


@lazySingleton
class LoginUseCase {
  final LoginRepositoryDomain _repositoryData;

  LoginUseCase(this._repositoryData);

   Future<Result<LoginEntity, Failure>> getLogin() async {
    return _repositoryData.getLogin();
  }
}
