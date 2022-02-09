import 'package:flutter/material.dart';
import 'package:leesojung/store/store1.dart';

class newProfile extends StatefulWidget {
  const newProfile({Key? key, this.pfimg}) : super(key: key);
  final pfimg;
  @override
  _newProfileState createState() => _newProfileState();
}

class _newProfileState extends State<newProfile> {
  var profileName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.file(widget.pfimg),
        TextField(
          controller: profileName,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        IconButton(
            onPressed: () {
              firestore.collection('profile').add(
                  {'name': profileName.text, 'img': widget.pfimg.toString()});

              Navigator.pop(context);
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}
