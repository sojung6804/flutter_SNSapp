import 'package:flutter/material.dart';

class newProfile extends StatefulWidget {
  const newProfile({Key? key, this.pfimg}) : super(key: key);
  final pfimg;
  @override
  _newProfileState createState() => _newProfileState();
}

class _newProfileState extends State<newProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.file(widget.pfimg),
        // TextField(onChanged: (text) {}),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}
