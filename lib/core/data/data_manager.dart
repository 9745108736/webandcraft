import 'package:webandcraft/core/data/preference_helper.dart';

abstract class DataManager implements PreferenceHelper {
  getList({String? url, dynamic headers, dynamic});
}
