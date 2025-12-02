import 'dart:convert';

import 'package:connect_x_sdk/src/repositories/upload/_upload_image_provider.dart';
import 'package:connect_x_sdk/src/utilities/_app_config.dart';
import 'package:connect_x_sdk/src/utilities/_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;

class UploadImageRepository {
  UploadImageProvider uploadImageProvider = UploadImageProvider();

  uploadImage({
    required String object,
    required dynamic base64Image,
    dynamic header,
  }) async {
    try {
      dynamic response = await uploadImageProvider.uploadImage(
        object: object,
        base64Image: base64Image,
        header: header,
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  checkPayload({
    required String object,
    required dynamic payload,
    dynamic header,
  }) async {
    for (final entry in payload.entries.toList()) {
      final key = entry.key;
      final value = entry.value;

      if (value is String) {
        dynamic pathImage = await getPathImage(path: value);
        if (pathImage == 'image') {
          try {
            final res = await uploadImage(
              object: object,
              base64Image: value,
              header: header,
            );
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

  uploadFile({required PlatformFile file, required String object}) async {
    Uri url = Uri.parse("${AppConfig.url}/connectx/api/storage/uploadFile");
    final mimeType = lookupMimeType(file.path!) ?? 'application/octet-stream';
    final request = http.MultipartRequest('POST', url);
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        file.path!,
        filename: file.name,
        contentType: MediaType.parse(mimeType),
      ),
    );
    dynamic localProfile =
        await CoreServiceStorage().getItem(key: AppConfig.loginStorage);
    var decode = await json.decode(localProfile);
    String organizeId = decode['organizeId'];
    request.fields['path'] = 'Organizes/$organizeId/objects/$object';

    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode != 201) {
      throw Exception('Upload failed: $respStr');
    }
    return jsonDecode(respStr);
  }
}
