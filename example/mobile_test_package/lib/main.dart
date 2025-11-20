import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connect_x_sdk_test/connect_x_sdk_test.dart';
import 'package:file_picker/file_picker.dart';
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
  List<PlatformFile> files = [];
  List upload = [
    {'name': 'Foward Facing Arms At Side', 'image': null, "file": null},
    {'name': 'Foward Facing Arms Above The Head', 'image': null, "file": null},
    {'name': 'Foward Facing Arms At Side', 'image': null, "file": null},
    {'name': 'Foward Facing Arms At Side', 'image': null, "file": null},
  ];
  dynamic payload = {};

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
                    username: 'conx.ppsi@gmail.com',
                    password: 'P@ssw0rd',
                    orgId: '',
                    fcmToken:
                        'cHfC1Nn0QE0EvtJwi3C3Qz:APA91bH8VeB5h0Vsv5EeNMTeTbq6rgdKiSvI5w-bYLQuB5_KvSyJjmoFhHieebo1THpMCF2Wvn_1ILb4OZgaZo12PxDioW17vjCS04lSmao_LmatKCSa5iE',
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
                  dynamic res = await ConnectXMobileSDK().sendOTP(body: body);
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
                  dynamic res = await ConnectXMobileSDK().verifyOTP(body: body);
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
                    username: "chatchawarn@m-intelligence.tech",
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
                    "username": "ppsiconx58@gmail.com",
                    "email": "ppsiconx58@gmail.com",
                    "firstName": "ppsiMobile58",
                    "lastName": "Conx",
                    "title": "",
                    "profileName": "admin",
                    "parent": "admin",
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
                      body: body,
                      param: "?isRequestOTP=true&isSendEmail=false");
                  users = json.decode(res.body);
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
            ],
          ),
        ),
      ),
    );
  }
}
