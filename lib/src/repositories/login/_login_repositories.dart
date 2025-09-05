import 'dart:convert';
import 'package:connect_x_sdk_test/src/repositories/login/_login_provider.dart';
import 'package:connect_x_sdk_test/src/utilities/_app_config.dart';
import 'package:connect_x_sdk_test/src/utilities/_storage.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart';

class LoginRepositories {
  LoginProvider loginProvider = LoginProvider();
  login({
    required String email,
    required String password,
    required String orgId,
  }) async {
    try {
      String message =
          "$password${email.toLowerCase().trim()}${AppConfig.token}";
      final key = utf8.encode(message);
      final data = utf8.encode('');

      final hmacSha1 = Hmac(sha1, key);
      final digest = hmacSha1.convert(data);

      Response response = await loginProvider.login(
        email: email,
        password: digest.toString(),
        orgId: orgId,
      );
      if (response.statusCode == 201) {
        await CoreServiceStorage()
            .setItem(key: AppConfig.loginStorage, value: response.body);
      }
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  loginExternalProfile({
    required String username,
    required String password,
    required String orgId,
    String? sessionId,
  }) async {
    try {
      String message =
          "$password${username.toLowerCase().trim()}${AppConfig.token}";
      final key = utf8.encode(message);
      final data = utf8.encode('');

      final hmacSha1 = Hmac(sha1, key);
      final digest = hmacSha1.convert(data);

      Response response = await loginProvider.loginExternalProfile(
        username: username,
        password: digest.toString(),
        orgId: orgId,
        sessionId: sessionId,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  resetPassword({required String code, required String password}) async {
    try {
      dynamic response =
          await loginProvider.resetPassword(code: code, password: password);
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  forgotPassword({required String username}) async {
    try {
      dynamic response = await loginProvider.forgotPassword(username: username);
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  logout() async {
    try {
      dynamic response = await loginProvider.logout();
      await CoreServiceStorage().removeItem(key: AppConfig.loginStorage);
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  sendOTP({required dynamic body}) async {
    try {
      dynamic response = await loginProvider.sendOTP(body: body);
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  verifyOTP({required dynamic body}) async {
    try {
      dynamic response = await loginProvider.verifyOTP(body: body);
      if (response.statusCode == 201) {
        await CoreServiceStorage()
            .setItem(key: AppConfig.loginStorage, value: response.body);
      }
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
