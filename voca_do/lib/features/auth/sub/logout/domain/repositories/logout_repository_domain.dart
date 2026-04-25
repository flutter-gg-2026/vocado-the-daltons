import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';

abstract class LogoutRepositoryDomain {
  Future<Result<void, Failure>> getLogout();
}
