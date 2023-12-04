import 'dart:convert';

import 'package:gpt_pill_03/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemeberUser {
  static Future<void> saveRememberUserInfo(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo
        .toJson()); // Shared preferences를 사용해서 데이터를 로컬에 저장할 때 json 포맷으로 저장됨
    await preferences.setString("currentUser", userJsonData);
  }
}
