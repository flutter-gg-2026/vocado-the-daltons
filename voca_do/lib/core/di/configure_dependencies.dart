import 'package:get_it/get_it.dart';
import 'package:voca_do/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/features/auth/login/di/login_di.dart';
import 'package:voca_do/features/task_creator/di/task_creator_di.dart';
import 'package:voca_do/features/task_viewer/di/task_viewer_di.dart';

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
    configureTaskCreator(getIt);
    configureTaskViewer(getIt);
}
