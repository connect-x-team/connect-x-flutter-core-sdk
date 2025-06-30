import 'package:connect_x_sdk_test/src/utilities/_app_config.dart';
import 'package:connect_x_sdk_test/src/utilities/_http.dart';

HttpService httpService = HttpService();

class UploadImageProvider {
  uploadImage({required String object, required String base64Image}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/storage/uploadFile");
    dynamic response =
        await httpService.multipartRequest(url: url, file: base64Image);
    return response;
  }
}
