import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sopia/store/store1.dart';

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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
          itemCount: 3,
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
