abstract class APIService {
  Future<dynamic> get(
    String? path,
    Map<String, String>? headers,
    Map<String, String>? params,
    bool hasToken,
  );

  Future<dynamic> postWithHeader(
      String path, dynamic headers, Map<String, dynamic> body, bool hasToken);
}
