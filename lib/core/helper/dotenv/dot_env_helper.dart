import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvHelper {
  static String getString(String key, {String? defaultValue}) {
    final value = dotenv.env[key];
    return value ?? defaultValue ?? '';
  }

}