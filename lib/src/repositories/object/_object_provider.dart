import 'dart:convert';

import 'package:connect_x_sdk_test/src/utilities/_app_config.dart';
import 'package:connect_x_sdk_test/src/utilities/_http.dart';

HttpService httpService = HttpService();

class ObjectProvider {
  getRecords({
    required String object,
    required dynamic payload,
  }) async {
    Uri url = Uri.parse(
      "${AppConfig.url}/connectx/api/object/$object/getRecords",
    );
    dynamic response = await httpService.post(
      url: url,
      body: json.encode(payload),
    );
    return response;
  }

  countRecords({
    required String object,
    required dynamic payload,
  }) async {
    Uri url =
        Uri.parse("${AppConfig.url}/connectx/api/object/$object/countRecords");
    dynamic response = await httpService.post(
      url: url,
      body: json.encode(payload),
    );
    return response;
  }

  createRecord({
    required String object,
    required dynamic payload,
  }) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/object/$object");
    dynamic response = await httpService.post(
      url: url,
      body: json.encode(payload),
    );
    return response;
  }

  updateRecord({
    required String object,
    required String externalId,
    required dynamic payload,
  }) async {
    Uri url = Uri.parse(
        "${AppConfig.url}/connectx/api/object/$object?externalId=$externalId");
    dynamic response = await httpService.patch(
      url: url,
      body: json.encode(payload),
    );
    return response;
  }
}
