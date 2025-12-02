library connect_x_sdk_test;

import 'package:connect_x_sdk/src/repositories/login/_login_repositories.dart';
import 'package:connect_x_sdk/src/repositories/object/_object_repositories.dart';
import 'package:connect_x_sdk/src/repositories/upload/_upload_image_repositories.dart';
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
    String? fcmToken,
  }) async {
    dynamic response = await LoginRepositories().loginExternalProfile(
        username: username,
        password: password,
        orgId: orgId,
        sessionId: sessionId,
        fcmToken: fcmToken);
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
    dynamic header,
  }) async {
    dynamic response = await ObjectRepositories()
        .getRecords(object: object, payload: payload, header: header);
    return response;
  }

  countObjectRecord({
    required String object,
    required dynamic payload,
    dynamic header,
  }) async {
    dynamic response = await ObjectRepositories()
        .countRecords(object: object, payload: payload, header: header);
    return response;
  }

  createRecords({
    required String object,
    required dynamic payload,
    dynamic header,
  }) async {
    dynamic response = await ObjectRepositories()
        .createRecord(object: object, payload: payload, header: header);
    return response;
  }

  updateRecords({
    required String object,
    required String externalId,
    required dynamic payload,
    dynamic header,
  }) async {
    dynamic response = await ObjectRepositories().updateRecord(
        object: object,
        payload: payload,
        externalId: externalId,
        header: header);
    return response;
  }

  uploadImage({
    required String object,
    required dynamic base64Image,
    dynamic header,
  }) async {
    dynamic response = await UploadImageRepository()
        .uploadImage(object: object, base64Image: base64Image, header: header);
    return response;
  }

  forgotPassword({
    required String username,
    dynamic header,
  }) async {
    dynamic response = await LoginRepositories()
        .forgotPassword(username: username, header: header);
    return response;
  }

  logout() async {
    dynamic response = await LoginRepositories().logout();
    return response;
  }

  getschemas({
    required String object,
    dynamic header,
  }) async {
    dynamic response =
        await ObjectRepositories().getSchemas(object: object, header: header);
    return response;
  }

  editRecord({
    required String object,
    required String docId,
    required dynamic payload,
    dynamic header,
  }) async {
    dynamic response = await ObjectRepositories().editRecord(
        object: object, docId: docId, payload: payload, header: header);
    return response;
  }

  sendLoginOTP({
    required dynamic body,
    dynamic header,
  }) async {
    dynamic response =
        await LoginRepositories().sendLoginOTP(body: body, header: header);
    return response;
  }

  verifyLoginOTP({
    required dynamic body,
    dynamic header,
  }) async {
    dynamic response =
        await LoginRepositories().verifyLoginOTP(body: body, header: header);
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

  searchObject({required dynamic payload}) async {
    dynamic response =
        await ObjectRepositories().searchObject(payload: payload);
    return response;
  }

  getRecordById({
    required String object,
    required dynamic docId,
  }) async {
    dynamic response = await ObjectRepositories().getRecordById(
      object: object,
      docId: docId,
    );
    return response;
  }

  inviteUser({
    required dynamic body,
    dynamic param,
    dynamic header,
  }) async {
    dynamic response = await LoginRepositories()
        .inviteUser(body: body, param: param ?? "", header: header);
    return response;
  }

  activeAccountByOTP({
    required dynamic body,
    dynamic header,
  }) async {
    dynamic response = await LoginRepositories()
        .activeAccountByOTP(body: body, header: header);
    return response;
  }

  createPassword({
    required dynamic body,
    dynamic header,
  }) async {
    dynamic response =
        await LoginRepositories().createPassword(body: body, header: header);
    return response;
  }

  searchKnowledge({required dynamic payload}) async {
    dynamic response =
        await ObjectRepositories().searchKnowledge(payload: payload);
    return response;
  }

  generateOTP({
    required dynamic body,
    dynamic header,
  }) async {
    dynamic response =
        await LoginRepositories().generateOTP(body: body, header: header);
    return response;
  }

  verifyOTP({
    required dynamic body,
    dynamic header,
  }) async {
    dynamic response =
        await LoginRepositories().verifyOTP(body: body, header: header);
    return response;
  }
}
