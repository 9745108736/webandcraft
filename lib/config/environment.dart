import 'base_config.dart';
import 'env/dev_config.dart';

class Environment {

  static final Environment _singleton = Environment._internal();

  factory Environment() => _singleton;

  Environment._internal();

  static const String dev = 'DEV';
  static const String staging = 'STAGING';
  static const String prod = 'PROD';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return DevConfig();
      case Environment.staging:
        return DevConfig();
      default:
        return DevConfig();
    }
  }
}