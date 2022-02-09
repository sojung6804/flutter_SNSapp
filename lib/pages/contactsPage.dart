import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leesojung/store/store1.dart';
import 'newProfile.dart';

class contactsPage extends StatefulWidget {
  const contactsPage({Key? key}) : super(key: key);

  @override
  _contactsPageState createState() => _contactsPageState();
}

class _contactsPageState extends State<contactsPage> {
  var fbData;

  getData() async {
    var result = await firestore.collection('profile').get();
    setState(() {
      fbData = result.docs;
    });
    print(fbData);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('프로필'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => newProfile()));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: fbData.length,
            itemBuilder: (c, i) {
              return ListTile(
                leading: fbData[i]["img"].runtimeType == String
                    ? CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(fbData[i]['img']),
                      )
                    : CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey,
                      ),
                title: Text(fbData[i]['name']),
              );
            }));
  }
}
