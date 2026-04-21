import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class ShowImageWidget extends StatelessWidget {
  final dynamic file;
  final double? height;
  final double? width;
  const ShowImageWidget({
    required this.file,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (file['extension'] == "jpeg" ||
          file['extension'] == "png" ||
          file['extension'] == "jpg" ||
          file['extension'] == "webp") {
        return Container(
          width: width ?? 180,
          height: height ?? 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.memory(
              file['bytes']!,
              width: width ?? 180,
              height: height ?? 120,
              fit: BoxFit.cover,
            ),
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.all(8),
          width: width ?? 180,
          height: height ?? 120,
          color: Color(0xffFFFBEB),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "file",
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        );
      }
    } else {
      if (file['extension'] == "jpeg" ||
          file['extension'] == "png" ||
          file['extension'] == "jpg" ||
          file['extension'] == "webp") {
        return Container(
          width: width ?? 180,
          height: height ?? 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(file['path'] ?? ""),
              width: width ?? 180,
              height: height ?? 120,
              fit: BoxFit.cover,
            ),
          ),
        );
      } else {
        File filePath = File(file['path'] ?? "");
        String basenames = path.basename(filePath.path);
        return Container(
          padding: EdgeInsets.all(8),
          width: width ?? 180,
          height: height ?? 120,
          color: Color(0xffFFFBEB),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                basenames,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        );
      }
    }
  }
}
