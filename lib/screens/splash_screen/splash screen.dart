import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/screens/auth/login_screen.dart';
import 'package:social_app/screens/mainscreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      // checkLoginStatus();
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "feedbook",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
