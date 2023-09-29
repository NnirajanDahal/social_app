import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user_detail_model.dart';

class SharedPreferencesUserDetailHelper {
  static const String _userDetailModelKey = 'userDetailModel';

  // Saving userdetail model to shared preferences
  static Future<void> saveUserDetailModel(
      UserDetailModel userDetailModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> userDetailJson = userDetailModel.toJson();
    await prefs.setString(_userDetailModelKey, jsonEncode(userDetailJson));
  }

  // Retrieving userdetail model from shared preferences
  static Future<UserDetailModel?> getUserDetailModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userDetailJsonString = prefs.getString(_userDetailModelKey);

    if (userDetailJsonString != null) {
      final Map<String, dynamic> userDetailJson =
          jsonDecode(userDetailJsonString);
      return UserDetailModel.fromJson(userDetailJson);
    } else {
      return null;
    }
  }
}
