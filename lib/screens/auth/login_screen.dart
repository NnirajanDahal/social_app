import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/user_model.dart';
import '../../widgets/widgets.dart';
import '../mainscreen/home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isClicked = false;
  List<UserModel> userList = [];
  // bool _isLowercase = false;
  // bool _isOneDigit = false;
  // bool _isUpperCase = false;
  // bool _isOneSpecialCharacter = false;
  // bool _is8charactersLong = false;

  Future<void> _loadUserData() async {
    setState(() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String prefData = pref.getString("userData") ?? "";
      if (prefData.isNotEmpty || prefData != "") {
        List mapData = (json.decode(prefData) as List<dynamic>)
            .map((e) => UserModel.fromMap(e))
            .toList();
        // print(prefData);
        if (mapData.isNotEmpty) {
          for (var i in mapData) {
            setState(() {
              userList.add(i);
            });
          }
        }
      }
    });
  }

  // Future<void> _fetchUserData() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final jsonData = prefs.getString('dataList');
  //     // log(jsonData.toString());

  //     if (jsonData == null) {
  //       String jsonData = await rootBundle.loadString('lib/services/user.json');
  //       final jsonList = json.decode(jsonData);
  //       //print(jsonList);
  //       if (jsonList is List<dynamic>) {
  //         userList = jsonList.map((json) => UserModel.fromMap(json)).toList();
  //       } else if (jsonList is Map<String, dynamic>) {
  //         userList.add(UserModel.fromMap(jsonList));
  //       }
  //       List jsonDataList = userList.map((e) => e.toMap()).toList();

  //       String jsonDataString = json.encode(jsonDataList);
  //       prefs.setString('dataList', jsonDataString);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // _fetchUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final jsonData = prefs.getString('userList');
  //   if (jsonData == null) {
  //     String jsonData = await rootBundle.loadString('lib/json/user.json');
  //     final jsonList = json.decode(jsonData);
  //     print(jsonList);
  //   }
  // }

  _login() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      UserModel users = userList.firstWhere((user) =>
          user.email == _emailController.text &&
          user.password == _passwordController.text);
      prefs.setString('userEmail', users.email);
      if (_formKey.currentState!.validate()
          //  &&
          //     _isUpperCase == true &&
          //     _isLowercase == true &&
          //     _is8charactersLong == true &&
          //     _isOneDigit == true &&
          //     _isOneSpecialCharacter == true
          ) {
        setState(() {
          _isClicked = true;
        });
      }

      await Future.delayed(const Duration(seconds: 1));

      // ignore: use_build_context_synchronously
      Navigator.push(context,
          CupertinoPageRoute(builder: ((context) => const HomePage())));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Account doesn't exists"),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> removeDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('userData');
    });
  }

  @override
  void initState() {
    // _fetchUserData();
    _loadUserData();

    super.initState();
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
                  height: 200,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                textField(
                  valiDator: (value) {
                    if (value != null &&
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return null;
                    }
                    return "Invalid Email";
                  },
                  text: "Email",
                  controller: _emailController,
                  prefixicon: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 10,
                ),
                textField(
                  valiDator: (value) {
                    if (value.isEmpty) {
                      return "Invalid password";
                    }
                    // if (value.length > 7) {
                    //   setState(() {
                    //     _is8charactersLong = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     _is8charactersLong = false;
                    //   });
                    // }

                    // if (value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                    //   setState(() {
                    //     _isOneSpecialCharacter = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     _isOneSpecialCharacter = false;
                    //   });
                    // }

                    // if (value.contains(RegExp(r'[A-Z]'))) {
                    //   setState(() {
                    //     _isUpperCase = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     _isUpperCase = false;
                    //   });
                    // }
                    // if (value.contains(RegExp(r'[a-z]'))) {
                    //   setState(() {
                    //     _isLowercase = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     _isLowercase = false;
                    //   });
                    // }

                    // if (value.contains(RegExp(r'[0-9]'))) {
                    //   setState(() {
                    //     _isOneDigit = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     _isOneDigit = false;
                    //   });
                    // }
                  },
                  obscuretext: _isObscure,
                  text: "Password",
                  controller: _passwordController,
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
                // Row(
                //   children: [
                //     const Text("-"),
                //     Text(
                //       "  uppercase letter",
                //       style: TextStyle(
                //           fontSize: 11,
                //           color: _isUpperCase ? Colors.green : Colors.red),
                //     ),
                //     _isUpperCase
                //         ? const Icon(
                //             Icons.done,
                //             size: 13,
                //             color: Colors.green,
                //           )
                //         : const SizedBox()
                //   ],
                // ),
                // Row(
                //   children: [
                //     const Text("-"),
                //     Text(
                //       "  lowercase letter",
                //       style: TextStyle(
                //           fontSize: 11,
                //           color: _isLowercase ? Colors.green : Colors.red),
                //     ),
                //     _isLowercase
                //         ? const Icon(
                //             Icons.done,
                //             size: 13,
                //             color: Colors.green,
                //           )
                //         : const SizedBox()
                //   ],
                // ),
                // Row(
                //   children: [
                //     const Text("-"),
                //     Text(
                //       "  at least one digit",
                //       style: TextStyle(
                //           fontSize: 11,
                //           color: _isOneDigit ? Colors.green : Colors.red),
                //     ),
                //     _isOneDigit
                //         ? const Icon(
                //             Icons.done,
                //             size: 13,
                //             color: Colors.green,
                //           )
                //         : const SizedBox()
                //   ],
                // ),
                // Row(
                //   children: [
                //     const Text("-"),
                //     Text(
                //       "  one special character",
                //       style: TextStyle(
                //           fontSize: 11,
                //           color: _isOneSpecialCharacter
                //               ? Colors.green
                //               : Colors.red),
                //     ),
                //     _isOneSpecialCharacter
                //         ? const Icon(
                //             Icons.done,
                //             size: 13,
                //             color: Colors.green,
                //           )
                //         : const SizedBox()
                //   ],
                // ),
                // Row(
                //   children: [
                //     const Text("-"),
                //     Text(
                //       "  8 characters long",
                //       style: TextStyle(
                //           fontSize: 11,
                //           color:
                //               _is8charactersLong ? Colors.green : Colors.red),
                //     ),
                //     _is8charactersLong
                //         ? const Icon(
                //             Icons.done,
                //             size: 13,
                //             color: Colors.green,
                //           )
                //         : const SizedBox()
                //   ],
                // ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: 50,
                    width: _isClicked ? 60 : 300,
                    decoration: BoxDecoration(
                        color: _isClicked
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Colors.deepPurple,
                        borderRadius: _isClicked
                            ? BorderRadius.circular(40)
                            : BorderRadius.circular(10)),
                    child: Center(
                        child: _isClicked
                            ? const Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 50,
                              )
                            : const Text("Login")),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text("Signup")),
                  ],
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       removeDataFromSharedPreferences();
                //     },
                //     child: const Text("Remove"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
