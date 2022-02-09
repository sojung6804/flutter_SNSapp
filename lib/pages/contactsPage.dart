import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class contactsPage extends StatefulWidget {
  const contactsPage({Key? key}) : super(key: key);

  @override
  _contactsPageState createState() => _contactsPageState();
}

class _contactsPageState extends State<contactsPage> {
  getData() async {
    var result = await firestore.collection('product').get();
    for (var fb in result.docs) {
      print(fb['name']);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
