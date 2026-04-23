import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/auth/login/domain/entities/login_entity.dart';

abstract class LoginRepositoryDomain {
    Future<Result<LoginEntity, Failure>> getLogin();
}
