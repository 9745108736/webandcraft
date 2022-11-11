
import '../base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "http://www.mocky.io/v2/";
  @override
  bool get isLogEnabled => true;
}