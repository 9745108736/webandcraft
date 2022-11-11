import 'package:webandcraft/core/data/remote/api_service.dart';
import 'package:webandcraft/core/data/remote/api_service_impl.dart';

import 'data_manager.dart';

class DataManagerImpl implements DataManager {
  APIService apiService = APIServiceImpl();

  DataManagerImpl._privateConstructor();

  static final DataManagerImpl _instance =
      DataManagerImpl._privateConstructor();

  factory DataManagerImpl() {
    return _instance;
  }

  @override
  getList({String? url, dynamic headers, dynamic}) async {
    var response = await apiService.get(url, headers, dynamic, false);
    return response;
    throw UnimplementedError();
  }
}
