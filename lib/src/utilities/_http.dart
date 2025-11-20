import 'dart:convert';

import 'package:connect_x_sdk/src/utilities/_app_config.dart';
import 'package:connect_x_sdk/src/utilities/_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class HttpService {
  post({required Uri url, dynamic body, Map<String, String>? header}) async {
    dynamic response =
        await http.post(url, body: body, headers: header ?? await _header());
    return response;
  }

  put({required Uri url, dynamic body, Map<String, String>? header}) async {
    dynamic response =
        await http.put(url, body: body, headers: header ?? await _header());
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

  multipartRequest(
      {required Uri url,
      dynamic body,
      required String file,
      required String object}) async {
    final request = http.MultipartRequest('POST', url);
    String removePrefix = file.split('base64,').last;
    Uint8List imageBytes = base64Decode(removePrefix);

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      imageBytes,
      filename: 'upload.jpeg',
      contentType: MediaType('image', 'jpeg'),
    ));
    dynamic localProfile =
        await CoreServiceStorage().getItem(key: AppConfig.loginStorage);
    var decode = await json.decode(localProfile);
    String organizeId = decode['organizeId'];
    request.fields['path'] = 'Organizes/$organizeId/objects/$object';

    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    return jsonDecode(respStr);
  }

  _header() async {
    try {
      dynamic localProfile =
          await CoreServiceStorage().getItem(key: AppConfig.loginStorage);
      var decode = await json.decode(localProfile);
      String token = '';
      if (decode != null) {
        token = decode['access_token'];
      }
      return {
        "Authorization": "Bearer $token",
        "Content-Type": "	application/json; charset=utf-8",
      };
    } catch (e) {
      print(e.toString());
    }
  }
}
