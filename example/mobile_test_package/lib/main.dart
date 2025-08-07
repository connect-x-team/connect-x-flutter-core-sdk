import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connect_x_sdk_test/connect_x_sdk_test.dart';
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
                  dynamic res = await ConnectXMobileSDK().login(
                    email: 'chatchawarn@m-intelligence.tech',
                    password: 'Paplam@89',
                    orgId: '',
                  );
                  print(res);
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
                  dynamic res = await ConnectXMobileSDK()
                      .getObjectRecord(object: 'customers', payload: {
                    "filterId": "pISE8Y4Eo9P3EEo0CAWU",
                    "offset": 0,
                    "limit": 25,
                    "order": {"id": "lastModified", "desc": true},
                    "q": "Mobile SDKTEST",
                    "where": "",
                  });
                  log(res.toString());
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
                    object: 'customers',
                    payload: {
                      'filterId': "pISE8Y4Eo9P3EEo0CAWU",
                      "q": "Mobile SDKTEST",
                      "where": "",
                    },
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
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 50,
                    childAspectRatio: 0.6,
                    maxCrossAxisExtent: 200,
                  ),
                  itemCount: upload.length,
                  itemBuilder: (context, index) {
                    var item = upload[index];
                    return Column(
                      children: [
                        if (item['image'] == null) ...[
                          InkWell(
                            onTap: () {
                              CoreServiceNavigator().bottomSheet(
                                context: context,
                                child: CoreServicePhoto().selectType(
                                  context: context,
                                  onSelect: (image) {
                                    item['image'] = image;
                                    pathToBase64(item['image']);
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                            child: Icon(
                              Icons.add_outlined,
                              size: 80,
                            ),
                          ),
                        ] else ...[
                          Image.file(
                            File(
                              item['image'],
                            ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(item['name']),
                        ]
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
