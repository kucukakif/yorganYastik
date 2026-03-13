import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get apiUser => dotenv.env['API_USER'] ?? '';
  static String get apiPass => dotenv.env['API_PASS'] ?? '';
  static String get clientId => dotenv.env['CLIENT_ID'] ?? '';
}
