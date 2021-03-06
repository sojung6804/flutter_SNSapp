import 'dart:io';

import 'package:flutter/material.dart';
import 'package:leesojung/pages/UserInputPage.dart';
import 'package:provider/src/provider.dart';
import 'package:leesojung/store/store1.dart';
import 'package:image_picker/image_picker.dart';

class feed extends StatefulWidget {
  const feed({Key? key}) : super(key: key);

  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드'),
        actions: [
          IconButton(
              onPressed: () async {
                var picker = ImagePicker();
                dynamic image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  dynamic ii = await File(image.path);
                  context.read<Store1>().addUI(ii);
                }
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return UserInputPage();
                }));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: context.watch<Store1>().jsonData.length,
          itemBuilder: (c, i) {
            return Column(children: [
              context.watch<Store1>().jsonData[i]["img"].runtimeType == String
                  ? Image.network(context.watch<Store1>().jsonData[i]["img"])
                  : Image.file(context.watch<Store1>().jsonData[i]["img"]),
              Text(context.watch<Store1>().jsonData[i]["name"])
            ]);
          }),
    );
  }
}
