import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/auth/sub/logout/domain/repositories/logout_repository_domain.dart';

@lazySingleton
class LogoutUseCase {
  final LogoutRepositoryDomain _repositoryData;

  LogoutUseCase(this._repositoryData);

  Future<Result<void, Failure>> getLogout() async {
    return _repositoryData.getLogout();
  }
}
