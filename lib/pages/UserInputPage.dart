import 'package:flutter/material.dart';
import 'package:leesojung/store/store1.dart';
import 'package:provider/src/provider.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  _UserInputPageState createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.file(context.watch<Store1>().UserImage),
        TextField(onChanged: (text) {
          context.read<Store1>().addUT(text);
        }),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        IconButton(
            onPressed: () {
              context.read<Store1>().createPost();
              Navigator.pop(context);
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}
