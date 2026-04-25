import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:voca_do/features/auth/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  Future<void> getLoginMethod({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final result = await _loginUseCase.getLogin(
      email: email,
      password: password,
    );
    result.when(
      (success) {
        emit(LoginSuccessState(role: success));
      },
      (whenError) {
        emit(LoginErrorState(message: whenError.message));
      },
    );
  }
}
