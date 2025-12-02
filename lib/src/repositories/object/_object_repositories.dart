import 'package:connect_x_sdk/src/repositories/object/_object_provider.dart';
import 'package:connect_x_sdk/src/repositories/upload/_upload_image_repositories.dart';
import 'package:http/http.dart';

class ObjectRepositories {
  ObjectProvider objectProvider = ObjectProvider();
  UploadImageRepository uploadImageRepository = UploadImageRepository();

  getRecords({
    required String object,
    required dynamic payload,
    dynamic header,
  }) async {
    try {
      Response response = await objectProvider.getRecords(
        object: object,
        payload: payload,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  countRecords({
    required String object,
    required dynamic payload,
    dynamic header,
  }) async {
    try {
      Response response = await objectProvider.countRecords(
        object: object,
        payload: payload,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  createRecord({
    required String object,
    required dynamic payload,
    dynamic header,
  }) async {
    try {
      dynamic newPayload = await uploadImageRepository.checkPayload(
        object: object,
        payload: payload,
      );
      Response response = await objectProvider.createRecord(
        object: object,
        payload: newPayload,
        header: header,
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
    dynamic header,
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
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  getSchemas({
    required String object,
    dynamic header,
  }) async {
    try {
      dynamic response = await objectProvider.getSchemas(
        object: object,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  editRecord({
    required String object,
    required String docId,
    dynamic header,
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
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  getExternalObject({
    required String object,
    required String param,
    dynamic header,
  }) async {
    try {
      Response response = await objectProvider.getExternalObject(
        object: object,
        param: param,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  searchObject({
    required dynamic payload,
    dynamic header,
  }) async {
    try {
      Response response = await objectProvider.searchObject(
        payload: payload,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  getRecordById({
    required String object,
    required String docId,
    dynamic header,
  }) async {
    try {
      Response response = await objectProvider.getRecordById(
        object: object,
        docId: docId,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  searchKnowledge({
    required dynamic payload,
    dynamic header,
  }) async {
    try {
      Response response = await objectProvider.searchKnowledge(
        payload: payload,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
