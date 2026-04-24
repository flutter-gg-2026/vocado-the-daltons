// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:voca_do/core/services/local_keys_service.dart' as _i302;
import 'package:voca_do/features/admin_home_screen/data/datasources/admin_home_screen_remote_data_source.dart'
    as _i744;
import 'package:voca_do/features/admin_home_screen/data/repositories/admin_home_screen_repository_data.dart'
    as _i912;
import 'package:voca_do/features/admin_home_screen/domain/repositories/admin_home_screen_repository_domain.dart'
    as _i1047;
import 'package:voca_do/features/admin_home_screen/domain/use_cases/admin_home_screen_use_case.dart'
    as _i82;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAdminHomeScreen({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i744.BaseAdminHomeScreenRemoteDataSource>(
      () => _i744.AdminHomeScreenRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i1047.AdminHomeScreenRepositoryDomain>(
      () => _i912.AdminHomeScreenRepositoryData(
        gh<_i744.BaseAdminHomeScreenRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i82.AdminHomeScreenUseCase>(
      () => _i82.AdminHomeScreenUseCase(
        gh<_i1047.AdminHomeScreenRepositoryDomain>(),
      ),
    );
    return this;
  }
}
