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
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InBwc2kuc3RhZ2luZzJAY29ubmVjdC14LnRlY2giLCJlbWFpbCI6InBwc2kuc3RhZ2luZzJAY29ubmVjdC14LnRlY2giLCJ1c2VySWQiOiI3Y1pLV3l4NHNZeTZqeFQ1ZjhhVyIsInN1YiI6IjdjWktXeXg0c1l5Nmp4VDVmOGFXIiwib3JnYW5pemVJZCI6IjFRMEFlTnI0VDlJQXM5RWN4WG9zIiwic3RheUxvZ2luIjp0cnVlLCJjdXN0b21Ub2tlbiI6ImV5SmhiR2NpT2lKU1V6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUpoZFdRaU9pSm9kSFJ3Y3pvdkwybGtaVzUwYVhSNWRHOXZiR3RwZEM1bmIyOW5iR1ZoY0dsekxtTnZiUzluYjI5bmJHVXVhV1JsYm5ScGRIa3VhV1JsYm5ScGRIbDBiMjlzYTJsMExuWXhMa2xrWlc1MGFYUjVWRzl2Ykd0cGRDSXNJbWxoZENJNk1UYzJNelV6T1RRMk55d2laWGh3SWpveE56WXpOVFF6TURZM0xDSnBjM01pT2lKbWFYSmxZbUZ6WlMxaFpHMXBibk5rYXkxblp6TTRNa0JqYjI1dVpXTjBMWGd0Y0hKdlpIVmpkR2x2Ymk1cFlXMHVaM05sY25acFkyVmhZMk52ZFc1MExtTnZiU0lzSW5OMVlpSTZJbVpwY21WaVlYTmxMV0ZrYldsdWMyUnJMV2RuTXpneVFHTnZibTVsWTNRdGVDMXdjbTlrZFdOMGFXOXVMbWxoYlM1bmMyVnlkbWxqWldGalkyOTFiblF1WTI5dElpd2lkV2xrSWpvaWNIQnphUzV6ZEdGbmFXNW5Na0JqYjI1dVpXTjBMWGd1ZEdWamFDSXNJbU5zWVdsdGN5STZleUp2Y21kSlpDSTZJakZSTUVGbFRuSTBWRGxKUVhNNVJXTjRXRzl6SW4xOS5JQTVNakc1T3JsbTd4cEJVcldHMXdfUGxTQXJXNkJGVmhra0pGVnhjc0JoMDY4NlVjY0praUFnRGJRS1h2cUhsUVhpaUZpU1VVS2FfVTNUZ0dQWGEtQWROdE42UXFsZlJtUklMV0FERUNHR29mbU0tMFNnSnRibU9NcS03a3p0V2RFcjllQ3F0dU5sVHVlZS12YkpBQ01PR1F3a1VfbXY5QVY0Z0NHN1VLdWlCd2ZiQkpIZ28wSUV3d3NwM19qS3ZqSkJpQkFiaF9MbDlJNXE4S0M2cFNoVE1Id2ZHVTlCNVFuSHdPUjVpdGRNOUxRTlNWWXltZmVManlETGdhdXVOYTlEUXlwaVdHeVJDYy1Kb2tYczJldk1yRGlSeDZRNnktZk56dXVCLWUxaHhmU1ZEeDMyaHREb3p0MmRFSzNWYm9XT3QzSEUwX2JvbjJBN1ZSQlJmaVEiLCJpbWFnZSI6IiIsImRpc3BsYXlOYW1lIjoiU3VwZXIgQWRtaW4iLCJpYXQiOjE3NjM1Mzk0NjcsImV4cCI6MzE3MzA3OTgxODY3fQ.YEgyAFHcgR9msj5fNzFnBPobE0QdUgs435UxjkcYVnU",
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
                    username: "ppsiconx111@gmail.com",
                    password: "Paplam@89",
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
                    "username": "ppsiconx111@gmail.com",
                    "email": "ppsiconx111@gmail.com",
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
                    "docId": "tFlerwFGldAsBZ2tPCid",
                    "password": "Paplam@89",
                    "organizeId": "1Q0AeNr4T9IAs9EcxXos",
                    "profileName": "externalUser",
                    "email": "ppsiconx111@gmail.com"
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
                  dynamic body = {
                    "email": "agency.ppsi@gmail.com",
                    "name": "test",
                    "payload": {}
                  };
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
                    "sessionId": "9aaca163-e0be-4cb7-92b3-c6ab767763f7",
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
