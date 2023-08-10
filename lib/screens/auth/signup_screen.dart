import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/screens/auth/login_screen.dart';
import '../../widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isLowercase = false;
  bool _isOneDigit = false;
  bool _isUpperCase = false;
  bool _isOneSpecialCharacter = false;
  bool _is8charactersLong = false;

  void _saveUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<UserModel> userList = [];
    UserModel userData = UserModel(
        firstName: firstNameController.text.toString(),
        lastName: lastNameController.text.toString(),
        email: emailController.text.toString(),
        password: passwordController.text.toString());
    String prefData = pref.getString("userData") ?? "";
    // print(prefData);
    if (prefData.isNotEmpty || prefData != "") {
      setState(() {
        List mapData = (json.decode(prefData) as List<dynamic>)
            .map((e) => UserModel.fromMap(e))
            .toList();
        if (mapData.isNotEmpty) {
          for (var i in mapData) {
            userList.add(i);
          }
        }
      });
    }
    setState(() async {
      userList.add(userData);
      String setData =
          json.encode(userList.map((item) => item.toMap()).toList());

      await pref.setString('userData', setData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                textField(
                  prefixicon: const Icon(Icons.keyboard),
                  text: "First Name",
                  controller: firstNameController,
                  valiDator: (value) {
                    if (value!.length > 10) {
                      return "Not >10 char";
                    } else if (value.isEmpty) {
                      return "Required";
                    }
                  },
                  inputformatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^[a-z A-Z]+$")),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                textField(
                  prefixicon: const Icon(Icons.keyboard),
                  text: "Last Name",
                  controller: lastNameController,
                  valiDator: (value) {
                    if (value!.length > 10) {
                      return "Not >10 char";
                    } else if (value.isEmpty) {
                      return "Required";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                textField(
                  prefixicon: const Icon(Icons.email),
                  text: "Email",
                  controller: emailController,
                  valiDator: (value) {
                    if (value != null &&
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return null;
                    }
                    return "Invalid Email";
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                textField(
                  valiDator: (value) {
                    if (value.length > 7) {
                      setState(() {
                        _is8charactersLong = true;
                      });
                    } else {
                      setState(() {
                        _is8charactersLong = false;
                      });
                    }

                    if (value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                      setState(() {
                        _isOneSpecialCharacter = true;
                      });
                    } else {
                      setState(() {
                        _isOneSpecialCharacter = false;
                      });
                    }

                    if (value.contains(RegExp(r'[A-Z]'))) {
                      setState(() {
                        _isUpperCase = true;
                      });
                    } else {
                      setState(() {
                        _isUpperCase = false;
                      });
                    }
                    if (value.contains(RegExp(r'[a-z]'))) {
                      setState(() {
                        _isLowercase = true;
                      });
                    } else {
                      setState(() {
                        _isLowercase = false;
                      });
                    }

                    if (value.contains(RegExp(r'[0-9]'))) {
                      setState(() {
                        _isOneDigit = true;
                      });
                    } else {
                      setState(() {
                        _isOneDigit = false;
                      });
                    }
                  },
                  obscuretext: _isObscure,
                  text: "Password",
                  controller: passwordController,
                  prefixicon: const Icon(Icons.key),
                  suffixicon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = _isObscure ? false : true;
                      });
                    },
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                Row(
                  children: [
                    const Text("-"),
                    Text(
                      "  uppercase letter",
                      style: TextStyle(
                          fontSize: 11,
                          color: _isUpperCase ? Colors.green : Colors.red),
                    ),
                    _isUpperCase
                        ? const Icon(
                            Icons.done,
                            size: 13,
                            color: Colors.green,
                          )
                        : const SizedBox()
                  ],
                ),
                Row(
                  children: [
                    const Text("-"),
                    Text(
                      "  lowercase letter",
                      style: TextStyle(
                          fontSize: 11,
                          color: _isLowercase ? Colors.green : Colors.red),
                    ),
                    _isLowercase
                        ? const Icon(
                            Icons.done,
                            size: 13,
                            color: Colors.green,
                          )
                        : const SizedBox()
                  ],
                ),
                Row(
                  children: [
                    const Text("-"),
                    Text(
                      "  at least one digit",
                      style: TextStyle(
                          fontSize: 11,
                          color: _isOneDigit ? Colors.green : Colors.red),
                    ),
                    _isOneDigit
                        ? const Icon(
                            Icons.done,
                            size: 13,
                            color: Colors.green,
                          )
                        : const SizedBox()
                  ],
                ),
                Row(
                  children: [
                    const Text("-"),
                    Text(
                      "  one special character",
                      style: TextStyle(
                          fontSize: 11,
                          color: _isOneSpecialCharacter
                              ? Colors.green
                              : Colors.red),
                    ),
                    _isOneSpecialCharacter
                        ? const Icon(
                            Icons.done,
                            size: 13,
                            color: Colors.green,
                          )
                        : const SizedBox()
                  ],
                ),
                Row(
                  children: [
                    const Text("-"),
                    Text(
                      "  8 characters long",
                      style: TextStyle(
                          fontSize: 11,
                          color:
                              _is8charactersLong ? Colors.green : Colors.red),
                    ),
                    _is8charactersLong
                        ? const Icon(
                            Icons.done,
                            size: 13,
                            color: Colors.green,
                          )
                        : const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _isUpperCase == true &&
                          _isLowercase == true &&
                          _is8charactersLong == true &&
                          _isOneDigit == true &&
                          _isOneSpecialCharacter == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("User created successfully")));
                        _saveUserData();

                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const LoginScreen()));
                      }
                    },
                    child: const Text("Sign Up"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
