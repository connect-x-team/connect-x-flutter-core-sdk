import 'dart:convert';

import 'package:connect_x_sdk/src/utilities/_app_config.dart';
import 'package:connect_x_sdk/src/utilities/_http.dart';

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

  getSchemas({required String object}) async {
    Uri url =
        Uri.parse("${AppConfig.url}/connectx/api/object/$object/getSchemas");
    dynamic response = await httpService.post(
      url: url,
    );
    return response;
  }

  editRecord(
      {required String object,
      required String docId,
      required dynamic payload}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/object/$object/$docId");
    dynamic response = await httpService.put(
      url: url,
      body: json.encode(payload),
    );
    return response;
  }

  getExternalObject({required String object, required String param}) async {
    Uri url = Uri.parse(
        "${AppConfig.url}/connectx/api/external/object/$object?$param");
    dynamic response = await httpService.get(url: url);
    return response;
  }

  searchObject({
    required dynamic payload,
  }) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/object/searchObject");
    dynamic response = await httpService.post(
      url: url,
      body: json.encode(payload),
    );
    return response;
  }

  getRecordById({required String object, required String docId}) async {
    Uri url = Uri.parse(
      "${AppConfig.url}/connectx/api/object/$object/getRecords/$docId",
    );
    dynamic response = await httpService.get(
      url: url,
    );
    return response;
  }

  searchKnowledge({required dynamic payload}) async {
    Uri url =
        Uri.parse("${AppConfig.url}/connectx/api/knowledge/searchKnowledge");
    dynamic response = await httpService.post(
      url: url,
      body: json.encode(payload),
    );
    return response;
  }
}
