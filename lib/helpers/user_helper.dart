import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user_model.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user_model.dart';

class SharedPreferencesUserHelper {
  static const String _userListKey = 'userList';

  // Save a list of user data to SharedPreferences
  static Future<void> saveUserList(List<UserModel> userList) async {
    final prefs = await SharedPreferences.getInstance();
    final userListJson = userList.map((user) => user.toJson()).toList();
    final jsonString = jsonEncode(userListJson);
    await prefs.setString(_userListKey, jsonString);
  }

  // Retrieve a list of user data from SharedPreferences
  static Future<List<UserModel>> getUserList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userListKey);

    if (jsonString == null) {
      return [];
    }

    final List<dynamic> userListJson = jsonDecode(jsonString);

    return userListJson.map((userJson) {
      return UserModel.fromJson(userJson);
    }).toList();
  }

//  Add a new user to the existing list

  // static Future<void> addUser(UserModel user) async {
  //   final existingUsers = await getUserList();
  //   existingUsers.add(user);
  //   await saveUserList(existingUsers);

  //   log(existingUsers.length.toString());
  // }
}
