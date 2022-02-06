import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store1 extends ChangeNotifier {
  var name = 'sopy';

  //이걸 몰랐네. store에 데이터가져오는 함수 만들어놓고 리스트로된 변수에 싹 때려박아서 위젯에 쏘면됨.
  var jsonData = [];
  var UserImage;
  var UserText;
  var CP;

  createPost() {
    var myPost = {
      "img": UserImage,
      "name": UserText,
    };
    CP = myPost;
    jsonData.insert(0, CP);
    // jsonData.insert(0, myPost);
    notifyListeners();
  }

  addUT(t) {
    UserText = t;
    notifyListeners();
  }

  addUI(u) {
    UserImage = u;
    notifyListeners();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    jsonData = data["jsonData"];
    notifyListeners();
    print(jsonData);
  }
}
