// api_endpoints.dart
class ApiEndpoints {
  ApiEndpoints._();

  // Gemini
  // @ 1
  static const String baseUrl = 'https://generativelanguage.googleapis.com';
  // @ 2
  static const String apiVersion = 'v1beta';
  // @ 3
  static const String model = 'gemini-2.5-flash';
  // @ 4
  static const String action = 'generateContent';

  // ============================================================================

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User
  static const String profile = '/user/profile';

  // Common
  static String userById(String id) => '/users/$id';
}
