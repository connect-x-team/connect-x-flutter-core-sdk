import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connect_x_sdk/connect_x_sdk_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
  List<PlatformFile> files = [];
  List upload = [
    {'name': 'Foward Facing Arms At Side', 'image': null, "file": null},
    {'name': 'Foward Facing Arms Above The Head', 'image': null, "file": null},
    {'name': 'Foward Facing Arms At Side', 'image': null, "file": null},
    {'name': 'Foward Facing Arms At Side', 'image': null, "file": null},
  ];
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
                    username: "",
                    password: "",
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
                  dynamic res = await ConnectXMobileSDK().forgotPassword(
                    username: "",
                  );
                  print(res);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text('forgot password'),
                ),
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
                  print(res);
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
                  print(res);
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
                    "docId": "",
                    "password": "",
                    "organizeId": "",
                    "profileName": "",
                    "email": ""
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
            ],
          ),
        ),
      ),
    );
  }
}
