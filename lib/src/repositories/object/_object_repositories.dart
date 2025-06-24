import 'dart:convert';

import 'package:connect_x_sdk_test/src/repositories/object/_object_provider.dart';
import 'package:http/http.dart';

class ObjectRepositories {
  ObjectProvider objectProvider = ObjectProvider();

  getRecords({
    required String object,
    required dynamic payload,
  }) async {
    try {
      Response response = await objectProvider.getRecords(
        object: object,
        payload: payload,
      );
      return json.decode(response.body);
    } catch (e) {
      return e.toString();
    }
  }

  countRecords({
    required String object,
    required dynamic payload,
  }) async {
    try {
      Response response = await objectProvider.countRecords(
        object: object,
        payload: payload,
      );
      return json.decode(response.body);
    } catch (e) {
      return e.toString();
    }
  }

  createRecord({
    required String object,
    required dynamic payload,
  }) async {
    try {
      Response response = await objectProvider.createRecord(
        object: object,
        payload: payload,
      );
      return json.decode(response.body);
    } catch (e) {
      return e.toString();
    }
  }

  updateRecord({
    required String object,
    required String externalId,
    required dynamic payload,
  }) async {
    try {
      Response response = await objectProvider.updateRecord(
        object: object,
        payload: payload,
        externalId: externalId,
      );
      return json.decode(response.body);
    } catch (e) {
      return e.toString();
    }
  }
}
