import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connect_x_sdk/connect_x_sdk_test.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test_package/navigator.dart';
import 'package:mobile_test_package/photo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic value;
  List fileList = [];

  List upload = [];
  dynamic payload = {};

  dynamic header = {
    "Authorization": "Bearer eyJhbGciOixxxx",
    "Content-Type": "	application/json; charset=utf-8",
  };
  dynamic users;
  String sessionID = '';

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

  Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      return android.id; // Android ID
    } else if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      return ios.identifierForVendor ?? "unknown"; // iOS Vendor ID
    }

    return "unknown";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final deviceId = await getDeviceId();
      print(deviceId);
    });
  }

  PlatformFile convertPathToPlatformFile(String path) {
    final file = File(path);
    final bytes = file.readAsBytesSync();

    return PlatformFile(
      name: path.split('/').last,
      path: path,
      size: bytes.length,
      bytes: bytes,
    );
  }

  PlatformFile convertWebBytesToPlatformFile(Uint8List bytes, String name) {
    return PlatformFile(
      name: name,
      size: bytes.length,
      bytes: bytes,
    );
  }

  uploadFile() async {
    final uploadFiles = [];
    print(upload);
    for (var i = 0; i < upload.length; i++) {
      PlatformFile item = !kIsWeb
          ? convertPathToPlatformFile(upload[i]['path'])
          : convertWebBytesToPlatformFile(
              upload[i]['bytes'], upload[i]['name']);
      uploadFiles.add(item);
    }
    await Future.delayed(Duration(milliseconds: 300));
    for (var file in uploadFiles) {
      print("file $file");
      dynamic res =
          await ConnectXMobileSDK().uploadFile(file: file, object: "notes");
      if (res['url'] != null) {
        fileList.add({
          "name": file.name,
          "size": file.size,
          "type": res['type'],
          "url": res['url'],
          "original": res['original'],
        });
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK().loginExternalProfile(
                    username: "conx.ppsi@gmail.com",
                    password: "P@ssw0rd",
                    orgId: '',
                  );
                  users = json.decode(res.body);
                  log('$users');
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic body = {
                    "userId": users['userId'],
                    "mode": "email",
                    "loginExternalProfile": "true",
                    "stayLogin": "true",
                    "sessionId": users['sessionId'],
                  };
                  dynamic res =
                      await ConnectXMobileSDK().sendLoginOTP(body: body);
                  dynamic data = json.decode(res.body);
                  sessionID = data['sessionId'];
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('sendOTP'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic body = {
                    "userId": users['userId'],
                    "sessionId": sessionID,
                    "otpCode": "941154"
                  };
                  await ConnectXMobileSDK().verifyLoginOTP(body: body);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('verifyOTP'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK()
                      .getObjectRecord(object: 'lead', payload: {});
                  print(res.statusCode);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('getRecord'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK().countObjectRecord(
                    object: 'lead',
                    payload: {},
                  );
                  print(res);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('countRecord'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK().getschemas(
                    object: 'lead',
                  );
                  print(res);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('getSchemas'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK().createRecords(
                    object: 'customers',
                    payload: {
                      "cx_Name": "Flutter UploadImageTest",
                      "cx_customerImage": payload['cx_customerImage']
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('create Record customer '),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK().updateRecords(
                    object: 'customers',
                    payload: {
                      "cx_Name": "Flutter UploadImageTest",
                      "cx_mobilePhone": "0859756000",
                      "cx_customerImage": payload['cx_customerImage']
                    },
                    externalId: 'cx_Name',
                  );
                  print(res);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('update Record customer '),
                ),
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK()
                      .forgotPassword(username: 'agency.ppsi@gmail.com');
                  print(res);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('forgot password '),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK().resetPassword(
                    username: "ppsiconx22",
                    code: "013d5e60-b20c-4b64-b325-7714560c1fee",
                    password: "P@ssw0rd1",
                  );
                  print(res);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('reset password '),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic res = await ConnectXMobileSDK().logout();
                  print(res);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Logout'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic body = {
                    "username": "",
                    "email": "",
                    "firstName": "ppsiMobile111",
                    "lastName": "Conxtest",
                    "title": "",
                    "profileName": "externalUser",
                    "parent": "externalUser",
                    "city": "",
                    "country": "",
                    "zipcode": "",
                    "mobile": "0859756666",
                    "capacity": 0,
                    "emailNotifications": false,
                    "inAppSoundNotifications": false,
                    "inAppWebPushNotifications": false,
                    "autoOffline": false,
                    "language": {"label": "English", "value": "en"},
                    "timezone": 7,
                    "personalNotifications": false,
                    "genesys": {},
                    "googleId": "",
                    "googleAccount": "",
                    "cx_enableSmsOtp": true,
                    "cx_enableEmailOtp": true
                  };
                  dynamic res = await ConnectXMobileSDK().inviteUser(
                      body: body, param: "?isSendEmail=false", header: header);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Create invite user'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic body = {
                    "docId": "mpT7zygOA881D2Z14k5P",
                    "password": "P@ssw0rd",
                    "organizeId": "1Q0AeNr4T9IAs9EcxXos",
                    "profileName": "externalUser",
                    "email": "conxppsi002"
                  };
                  dynamic res = await ConnectXMobileSDK().createPassword(
                    body: body,
                    header: header,
                  );
                  dynamic ressss = json.decode(res.body);
                  log('$ressss');
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('create password'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic body = {
                    "sessionId": users['sessionId'],
                    "refCode": users['refCode'],
                    "otpCode": "750786"
                  };
                  dynamic res = await ConnectXMobileSDK().activeAccountByOTP(
                    body: body,
                  );
                  users = json.decode(res.body);
                  log(users);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Active user'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic body = {"email": "", "name": "", "payload": {}};
                  dynamic res = await ConnectXMobileSDK()
                      .generateOTP(body: body, header: header);
                  res = json.decode(res.body);
                  print('${res}');
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('generateOTP'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  dynamic body = {
                    "sessionId": "",
                    "refCode": "WQMN",
                    "otpCode": "682656"
                  };
                  dynamic res = await ConnectXMobileSDK()
                      .verifyOTP(body: body, header: header);
                  res = json.decode(res.body);
                  print('${res}');
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('verifyOTP'),
                ),
              ),
              InkWell(
                onTap: () {
                  CoreServiceNavigator().bottomSheet(
                    context: context,
                    child: CoreServicePhoto().selectType(
                      context: context,
                      onSelect: (PlatformFile image) async {
                        dynamic item = {};
                        if (!kIsWeb) {
                          item['path'] = image.path;
                        }
                        item['bytes'] = image.bytes;
                        item['extension'] = image.extension;
                        item['name'] = image.name;
                        upload.add(item);
                        setState(() {});
                      },
                    ),
                  );
                },
                child: Container(
                  width: 180,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Upload",
                        style: TextStyle(),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  uploadFile();
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('upload file'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
