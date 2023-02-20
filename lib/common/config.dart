// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

// final env = e
class AppConfig {
  static final API_KEY = dotenv.env['API_KEY'];
  static final API_URL = dotenv.env['API_URL'];
  static final IMAGE_URL = dotenv.env['IMAGE_URL'];
}