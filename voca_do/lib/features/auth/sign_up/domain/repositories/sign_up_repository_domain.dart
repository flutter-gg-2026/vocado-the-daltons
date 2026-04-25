import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';

abstract class SignUpRepositoryDomain {
  Future<Result<bool, Failure>> getSignUp({
    required String name,
    required String email,
    required String password,
  });
}
