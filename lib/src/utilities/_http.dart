import 'dart:convert';

import 'package:connect_x_sdk_test/src/utilities/_app_config.dart';
import 'package:connect_x_sdk_test/src/utilities/_storage.dart';
import 'package:http/http.dart' as http;

class HttpService {
  post({required Uri url, dynamic body, Map<String, String>? header}) async {
    dynamic response =
        await http.post(url, body: body, headers: header ?? await _header());
    return response;
  }

  get({required Uri url, Map<String, String>? header}) async {
    dynamic response = await http.get(url, headers: header ?? await _header());
    return response;
  }

  patch({required Uri url, dynamic body, Map<String, String>? header}) async {
    dynamic response =
        await http.patch(url, body: body, headers: header ?? await _header());
    return response;
  }

  _header() async {
    try {
      dynamic localProfile =
          await CoreServiceStorage().getItem(key: AppConfig.loginStorage);
      var decode = await json.decode(localProfile);
      String token = decode['access_token'];
      return {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json; charset=utf-8",
      };
    } catch (e) {
      ////
    }
  }
}
