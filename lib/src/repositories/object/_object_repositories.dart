import 'package:connect_x_sdk_test/src/repositories/object/_object_provider.dart';
import 'package:connect_x_sdk_test/src/repositories/upload/_upload_image_repositories.dart';
import 'package:http/http.dart';

class ObjectRepositories {
  ObjectProvider objectProvider = ObjectProvider();
  UploadImageRepository uploadImageRepository = UploadImageRepository();

  getRecords({
    required String object,
    required dynamic payload,
  }) async {
    try {
      Response response = await objectProvider.getRecords(
        object: object,
        payload: payload,
      );
      return response;
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
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  createRecord({
    required String object,
    required dynamic payload,
  }) async {
    try {
      dynamic newPayload = await uploadImageRepository.checkPayload(
        object: object,
        payload: payload,
      );
      Response response = await objectProvider.createRecord(
        object: object,
        payload: newPayload,
      );
      return response;
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
      dynamic newPayload = await uploadImageRepository.checkPayload(
        object: object,
        payload: payload,
      );
      Response response = await objectProvider.updateRecord(
        object: object,
        payload: newPayload,
        externalId: externalId,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  getSchemas({required String object}) async {
    try {
      dynamic response = await objectProvider.getSchemas(object: object);
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  editRecord({
    required String object,
    required String docId,
    required dynamic payload,
  }) async {
    try {
      dynamic newPayload = await uploadImageRepository.checkPayload(
        object: object,
        payload: payload,
      );
      Response response = await objectProvider.editRecord(
        object: object,
        payload: newPayload,
        docId: docId,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
