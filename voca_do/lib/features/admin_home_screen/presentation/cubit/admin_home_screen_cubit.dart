import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/admin_home_screen/domain/use_cases/admin_home_screen_use_case.dart';
import 'package:voca_do/features/admin_home_screen/presentation/cubit/admin_home_screen_state.dart';

class AdminHomeScreenCubit extends Cubit<AdminHomeScreenState> {
  final AdminHomeScreenUseCase _adminHomeScreenUseCase;

  AdminHomeScreenCubit(this._adminHomeScreenUseCase)
    : super(AdminHomeScreenInitialState());

  Future<void> getAdminHomeScreenMethod() async {
    final result = await _adminHomeScreenUseCase.getAdminHomeScreen();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
        //here is when error result
      },
    );
  }
}
