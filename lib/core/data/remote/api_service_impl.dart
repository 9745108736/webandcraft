import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../config/environment.dart';
import 'api_service.dart';
import 'package:http/http.dart' as http;

class APIServiceImpl implements APIService {
  String? apiHost;

  APIServiceImpl._privateConstructor();

  static final APIServiceImpl _instance = APIServiceImpl._privateConstructor();

  factory APIServiceImpl() {
    return _instance;
  }

  @override
  Future get(
    String? path,
    Map<String, String>? headers,
    Map<String, String>? params,
    bool hasToken,
  ) async {
    apiHost = Environment().config.apiHost;
    // var url = Uri.https(apiHost!, path!, params);
    String _url = apiHost! + path!;
    var url = Uri.parse(_url);
    debugPrint("url - $url");
    var client = http.Client();
    try {
      var response = await client.get(
        url,
        headers: headers,
      );
      print(response.toString());
      return response;
    } finally {
      client.close();
    }
  }

  @override
  Future postWithHeader(
      String path, headers, Map<String, dynamic> body, bool hasToken) async {
    apiHost = Environment().config.apiHost;
    var url = Uri.https(apiHost!, path);
    debugPrint("postWithHeader URL - $url");

    debugPrint(" Map<String, dynamic> body - ${body.toString()}");
    debugPrint('hhh $headers');
    var client = http.Client();

    try {
      var response = await client.post(url,
          // body: body,
          body: json.encode(body),
          headers: headers,
          encoding: Encoding.getByName("utf-8"));
      debugPrint("postWithHeader Response");
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      return response;
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }
}
