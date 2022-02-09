import 'package:flutter/material.dart';

class newProfile extends StatefulWidget {
  const newProfile({Key? key}) : super(key: key);
  @override
  _newProfileState createState() => _newProfileState();
}

class _newProfileState extends State<newProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('새 프로필 등록 위젯'),
    );
  }
}
