import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/auth/sub/logout/domain/use_cases/logout_use_case.dart';
import 'package:voca_do/features/auth/sub/logout/presentation/cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase _logoutUseCase;

  LogoutCubit(this._logoutUseCase) : super(LogoutInitialState());

  Future<void> getLogoutMethod() async {
    final result = await _logoutUseCase.getLogout();
    result.when(
      (success) {
        emit(LogoutSuccessState());
      },
      (whenError) {
        emit(LogoutErrorState(message: whenError.message));
      },
    );
  }
}
