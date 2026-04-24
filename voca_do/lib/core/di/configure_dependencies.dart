import 'package:get_it/get_it.dart';
import 'package:voca_do/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/features/auth/login/di/login_di.dart';
import 'package:voca_do/features/task_viewer/di/task_viewer_di.dart';
import 'package:voca_do/features/admin_home_screen/di/admin_home_screen_di.dart';
import 'package:voca_do/features/sub/audio_feature/di/audio_feature_di.dart';
import 'package:voca_do/features/add_task_screen/di/add_task_screen_di.dart';

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
    configureAdminHomeScreen(getIt);
    configureAudioFeatureSub(getIt);
    configureAddTaskScreen(getIt);
}
