import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user_model.dart';

class SharedPreferencesUserHelper {
  static const String _userModelKey = 'userModel';

  // Save UserModel to SharedPreferences
  static Future<void> saveUserModel(UserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> userJson = userModel.toJson();
    await prefs.setString(_userModelKey, jsonEncode(userJson));
  }

  // Retrieve UserModel from SharedPreferences
  static Future<UserModel?> getUserModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJsonString = prefs.getString(_userModelKey);

    if (userJsonString != null) {
      final Map<String, dynamic> userJson = jsonDecode(userJsonString);
      return UserModel.fromJson(userJson);
    } else {
      return null;
    }
  }
}
