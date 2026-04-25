import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'url_supabase')
  static final String urlSupabase = _Env.urlSupabase;

  @EnviedField(varName: 'key_supabase')
  static final String keySupabase = _Env.keySupabase;

  @EnviedField(varName: 'gemini_api_key')
  static final String geminiApiKey = _Env.geminiApiKey;

  @EnviedField(varName: 'gladia_api_key')
  static final String gladiaApiKey = _Env.gladiaApiKey;
}
