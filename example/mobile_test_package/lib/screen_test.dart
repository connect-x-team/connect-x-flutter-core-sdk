import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_test_package/navigator.dart';
import 'package:mobile_test_package/photo.dart';

class UploadYourPhotoScreen extends StatefulWidget {
  const UploadYourPhotoScreen({super.key});

  @override
  State<UploadYourPhotoScreen> createState() => _UploadYourPhotoScreenState();
}

class _UploadYourPhotoScreenState extends State<UploadYourPhotoScreen> {
  List upload = [
    {'name': 'Foward Facing Arms At Side', 'image': null},
    {'name': 'Foward Facing Arms Above The Head', 'image': null},
    {'name': 'Foward Facing Arms At Side', 'image': null},
    {'name': 'Foward Facing Arms At Side', 'image': null},
  ];
  dynamic payload = {};

  delectImage(dynamic item) async {
    item['image'] = null;
    setState(() {});
  }

  pathToBase64(image) async {
    File imageFile = File(image);
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    String mimeType = 'jpeg';
    if (image.endsWith('.png')) {
      mimeType = 'png';
    } else if (image.endsWith('.webp')) {
      mimeType = 'webp';
    }
    String imageBase64 = 'data:image/$mimeType;base64,$base64Image';

    payload['cx_customerImage'] = imageBase64;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Text(
              "Upload Your Photo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Support file or Not over 10MB',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
