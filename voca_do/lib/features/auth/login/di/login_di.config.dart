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
import 'package:voca_do/features/auth/login/data/datasources/login_remote_data_source.dart'
    as _i326;
import 'package:voca_do/features/auth/login/data/repositories/login_repository_data.dart'
    as _i707;
import 'package:voca_do/features/auth/login/domain/repositories/login_repository_domain.dart'
    as _i262;
import 'package:voca_do/features/auth/login/domain/use_cases/login_use_case.dart'
    as _i1023;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLogin({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i326.BaseLoginRemoteDataSource>(
      () => _i326.LoginRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i262.LoginRepositoryDomain>(
      () => _i707.LoginRepositoryData(gh<_i326.BaseLoginRemoteDataSource>()),
    );
    gh.lazySingleton<_i1023.LoginUseCase>(
      () => _i1023.LoginUseCase(gh<_i262.LoginRepositoryDomain>()),
    );
    return this;
  }
}
