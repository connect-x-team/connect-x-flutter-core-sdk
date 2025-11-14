import 'dart:convert';

import 'package:connect_x_sdk_test/src/utilities/_app_config.dart';
import 'package:connect_x_sdk_test/src/utilities/_http.dart';

HttpService httpService = HttpService();

class LoginProvider {
  login(
      {required String email,
      required String password,
      required String orgId}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/auth/login/");
    dynamic body = {
      'email': email,
      'password': password,
      'stayLogin': "true",
    };
    dynamic response = await httpService.post(url: url, body: body, header: {});
    return response;
  }

  loginExternalProfile({
    required String username,
    required String password,
    required String orgId,
    String? sessionId,
    String? fcmToken,
  }) async {
    Uri url =
        Uri.parse("${AppConfig.url}/connectx/api/auth/loginExternalProfile/");
    dynamic body = {
      'username': username,
      'password': password,
      'stayLogin': "true",
      'sessionId': sessionId ?? "",
      "fcmToken": fcmToken ?? ""
    };
    dynamic response = await httpService.post(url: url, body: body, header: {});
    return response;
  }

  resetPassword({required String code, required String password}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/auth/resetPassword");
    dynamic response = await httpService.post(url: url, body: {
      "forgotPasswordCode": code,
      "password": password,
    });
    return response;
  }

  forgotPassword({required String username}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/auth/forgotPassword");
    dynamic response = await httpService.post(url: url, body: {
      "username": username,
    }, header: {
      "Origin": "https://app.connect-x.tech"
    });
    return response;
  }

  logout() async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/auth/logout");
    dynamic response = await httpService.get(url: url);
    return response;
  }

  sendOTP({required dynamic body}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/auth/sendOTP");
    dynamic response = await httpService.post(url: url, body: body, header: {});
    return response;
  }

  verifyOTP({required dynamic body}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/auth/verifyOTP");
    dynamic response = await httpService.post(url: url, body: body, header: {});
    return response;
  }

  inviteUser({required dynamic body, dynamic param}) async {
    Uri url = Uri.parse(
        "${AppConfig.url}/connectx/api/auth/inviteUser${param ?? ""}");
    dynamic response =
        await httpService.post(url: url, body: json.encode(body));
    return response;
  }

  activeAccountByOTP({required dynamic body}) async {
    Uri url =
        Uri.parse("${AppConfig.url}/connectx/api/auth/activeAccountByOTP");
    dynamic response =
        await httpService.post(url: url, body: json.encode(body));
    return response;
  }

  createPassword({required dynamic body}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/auth/createPassword");
    dynamic response =
        await httpService.post(url: url, body: json.encode(body));
    return response;
  }
}
