import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/auth/sub/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:voca_do/features/auth/sub/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordCubit(this._forgetPasswordUseCase) : super(ForgetPasswordInitialState());

  Future<void> getForgetPasswordMethod() async {
    final result = await _forgetPasswordUseCase.getForgetPassword();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
