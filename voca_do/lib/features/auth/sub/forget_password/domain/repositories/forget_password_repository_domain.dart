import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/auth/sub/forget_password/domain/entities/forget_password_entity.dart';

abstract class ForgetPasswordRepositoryDomain {
    Future<Result<ForgetPasswordEntity, Failure>> getForgetPassword();
}
