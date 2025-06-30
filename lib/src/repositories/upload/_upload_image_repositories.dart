import 'package:connect_x_sdk_test/src/repositories/upload/_upload_image_provider.dart';

class UploadImageRepository {
  UploadImageProvider uploadImageProvider = UploadImageProvider();

  uploadImage({required String object, required dynamic base64Image}) async {
    try {
      dynamic response = await uploadImageProvider.uploadImage(
        object: object,
        base64Image: base64Image,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  checkPayload({required String object, required dynamic payload}) async {
    for (final entry in payload.entries.toList()) {
      final key = entry.key;
      final value = entry.value;

      if (value is String) {
        dynamic pathImage = await getPathImage(path: value);
        if (pathImage == 'image') {
          try {
            final res = await uploadImage(object: object, base64Image: value);
            payload[key] = res['url'];
          } catch (e) {
            return e.toString();
          }
        }
      }
    }
    return payload;
  }

  getPathImage({String? path}) async {
    if (path!.isEmpty) return 'unknown';
    if (path.startsWith('data:image')) return 'image';
    return 'unknown';
  }
}
