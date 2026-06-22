import 'package:cv_scan_core/src/config/api_config.dart';
import 'package:cv_scan_core/src/config/app_environment.dart';
import 'package:cv_scan_core/src/config/pagination_config.dart';

class Config {
  Config._();

  static final Config _instance = Config._();
  static Config get i => _instance;

  static const String _env = String.fromEnvironment('ENV', defaultValue: 'dev');

  final AppEnvironment env = AppEnvironment.fromString(_env);
  final ApiConfig api = const ApiConfig();
  final PaginationConfig pagination = const PaginationConfig();
}
