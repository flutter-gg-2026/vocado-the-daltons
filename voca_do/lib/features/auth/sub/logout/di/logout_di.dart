import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/features/auth/sub/logout/di/logout_di.config.dart';

@InjectableInit(
  initializerName: 'initLogout',
  generateForDir: ['lib/features/auth/sub/logout'],
)
void configureLogout(GetIt getIt) {
  getIt.initLogout();
}