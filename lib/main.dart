import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leesojung/pages/contactsPage.dart';
import 'package:leesojung/pages/feed.dart';
import 'store/store1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (c) => Store1(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<Store1>().readJson();
    super.initState();
  }

  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [feed(), contactsPage()][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.feed_outlined), label: '피드'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: '친구목록')
        ],
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
      ),
    );
  }
}
