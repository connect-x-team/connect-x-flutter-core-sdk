import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_test_package/navigator.dart';

class CoreServicePhoto {
  final ImagePicker pickerImage = ImagePicker();

  pickImageGallery(context) async {
    try {
      final picker = await pickerImage.pickImage(source: ImageSource.gallery);
      if (picker != null) {
        var file = File(picker.path).lengthSync();

        return picker.path;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  pickImageCameara(context) async {
    final picker = await pickerImage.pickImage(source: ImageSource.camera);
    if (picker != null) {
      var file = File(picker.path).lengthSync();
      return picker.path;
    }
  }

  selectType({required BuildContext context, required Function onSelect}) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () async {
            var item = await pickImageCameara(context);
            onSelect(item);
            CoreServiceNavigator().pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text('Camera'),
          ),
        ),
        Divider(
          height: 4,
        ),
        InkWell(
          onTap: () async {
            var item = await pickImageGallery(context);
            onSelect(item);
            CoreServiceNavigator().pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text('Gallery'),
          ),
        ),
        Divider(
          height: 4,
        ),
      ],
    );
  }
}
