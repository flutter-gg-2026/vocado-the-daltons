import 'package:get_it/get_it.dart';
import 'package:voca_do/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/features/auth/login/di/login_di.dart';
import 'package:voca_do/features/auth/sub/logout/di/logout_di.dart';
import 'package:voca_do/features/task_viewer/di/task_viewer_di.dart';
import 'package:voca_do/features/auth/sign_up/di/sign_up_di.dart';
import 'package:voca_do/features/task_creator/profile/di/profile_di.dart';
import 'package:voca_do/features/task_creator/tasks_board/di/tasks_board_di.dart';
import 'package:voca_do/features/task_creator/team/di/team_di.dart';
import 'package:voca_do/features/task_creator/home/di/home_di.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  generateForDir: ['lib/core'],
)
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
  configureLogin(getIt);
  configureTaskViewer(getIt);
  // configureAdminHomeScreen(getIt);
  // configureAudioFeatureSub(getIt);
  // configureAddTaskScreen(getIt);
  configureSignUp(getIt);
  configureProfile(getIt);
  configureTasksBoard(getIt);
  configureTeam(getIt);
  configureHome(getIt);
  configureLogout(getIt);
}
