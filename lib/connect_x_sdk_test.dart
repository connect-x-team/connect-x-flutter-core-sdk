library connect_x_sdk_test;

import 'package:connect_x_sdk_test/src/repositories/login/_login_repositories.dart';
import 'package:connect_x_sdk_test/src/repositories/object/_object_repositories.dart';
import 'package:connect_x_sdk_test/src/repositories/upload/_upload_image_repositories.dart';
import 'package:file_picker/file_picker.dart';

class ConnectXMobileSDK {
  login(
      {required String email,
      required String password,
      required String orgId}) async {
    dynamic response = await LoginRepositories().login(
      email: email,
      password: password,
      orgId: orgId,
    );
    return response;
  }

  loginExternalProfile({
    required String username,
    required String password,
    required String orgId,
    String? sessionId,
  }) async {
    dynamic response = await LoginRepositories().loginExternalProfile(
      username: username,
      password: password,
      orgId: orgId,
      sessionId: sessionId,
    );
    return response;
  }

  // resetPassword({required String code, required String password}) async {
  //   dynamic response =
  //       await LoginRepositories().resetPassword(code: code, password: password);
  //   return response;
  // }

  getObjectRecord({
    required String object,
    required dynamic payload,
  }) async {
    dynamic response = await ObjectRepositories().getRecords(
      object: object,
      payload: payload,
    );
    return response;
  }

  countObjectRecord({
    required String object,
    required dynamic payload,
  }) async {
    dynamic response = await ObjectRepositories().countRecords(
      object: object,
      payload: payload,
    );
    return response;
  }

  createRecords({
    required String object,
    required dynamic payload,
  }) async {
    dynamic response = await ObjectRepositories().createRecord(
      object: object,
      payload: payload,
    );
    return response;
  }

  updateRecords({
    required String object,
    required String externalId,
    required dynamic payload,
  }) async {
    dynamic response = await ObjectRepositories().updateRecord(
      object: object,
      payload: payload,
      externalId: externalId,
    );
    return response;
  }

  uploadImage({
    required String object,
    required dynamic base64Image,
  }) async {
    dynamic response = await UploadImageRepository()
        .uploadImage(object: object, base64Image: base64Image);
    return response;
  }

  forgotPassword({required String username}) async {
    dynamic response =
        await LoginRepositories().forgotPassword(username: username);
    return response;
  }

  logout() async {
    dynamic response = await LoginRepositories().logout();
    return response;
  }

  getschemas({required String object}) async {
    dynamic response = await ObjectRepositories().getSchemas(
      object: object,
    );
    return response;
  }

  editRecord({
    required String object,
    required String docId,
    required dynamic payload,
  }) async {
    dynamic response = await ObjectRepositories().editRecord(
      object: object,
      docId: docId,
      payload: payload,
    );
    return response;
  }

  sendOTP({required dynamic body}) async {
    dynamic response = await LoginRepositories().sendOTP(body: body);
    return response;
  }

  verifyOTP({required dynamic body}) async {
    dynamic response = await LoginRepositories().verifyOTP(body: body);
    return response;
  }

  getExternalObject({required String object, required String param}) async {
    dynamic response = await ObjectRepositories()
        .getExternalObject(object: object, param: param);
    return response;
  }

  uploadFile({required PlatformFile file, required String object}) {
    dynamic response =
        UploadImageRepository().uploadFile(object: object, file: file);
    return response;
  }
}
