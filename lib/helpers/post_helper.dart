import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/post_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class PostManager {
  static const String _postsKey = 'posts';

  // Save a list of posts to SharedPreferences
  static Future<void> savePosts(List<PostModel> posts) async {
    final prefs = await SharedPreferences.getInstance();
    final postList = posts.map((post) => post.toMap()).toList();
    final jsonString = jsonEncode(postList); // Serialize to JSON
    await prefs.setString(_postsKey, jsonString);
  }

  // Retrieve a list of posts from SharedPreferences
  static Future<List<PostModel>> getPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_postsKey);

    if (jsonString == null) {
      return [];
    }

    final List<dynamic> postList = jsonDecode(jsonString);

    return postList.map((postMap) {
      return PostModel.fromMap(postMap);
    }).toList();
  }
}
