import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'url_supabase')
  static final String urlSupabase = _Env.urlSupabase;

  @EnviedField(varName: 'key_supabase')
  static final String keySupabase = _Env.keySupabase;
}
