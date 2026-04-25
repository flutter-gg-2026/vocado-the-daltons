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
import 'package:voca_do/features/auth/sub/logout/data/datasources/logout_remote_data_source.dart'
    as _i13;
import 'package:voca_do/features/auth/sub/logout/data/repositories/logout_repository_data.dart'
    as _i300;
import 'package:voca_do/features/auth/sub/logout/domain/repositories/logout_repository_domain.dart'
    as _i476;
import 'package:voca_do/features/auth/sub/logout/domain/use_cases/logout_use_case.dart'
    as _i719;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLogout({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i13.BaseLogoutRemoteDataSource>(
      () => _i13.LogoutRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i476.LogoutRepositoryDomain>(
      () => _i300.LogoutRepositoryData(gh<_i13.BaseLogoutRemoteDataSource>()),
    );
    gh.lazySingleton<_i719.LogoutUseCase>(
      () => _i719.LogoutUseCase(gh<_i476.LogoutRepositoryDomain>()),
    );
    return this;
  }
}
