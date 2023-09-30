import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/helpers/user_helper.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/screens/auth/login_screen.dart';
import 'package:uuid/uuid.dart';
import '../../widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // final TextEditingController firstNameController = TextEditingController();
  // final TextEditingController lastNameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isLowercase = false;
  bool _isOneDigit = false;
  bool _isUpperCase = false;
  bool _isOneSpecialCharacter = false;
  bool _is8charactersLong = false;

  handleSignUp() async {
    String enteredEmail = usernameController.text;
    String enteredPassword = passwordController.text;
    final retrievedUser = await SharedPreferencesUserHelper.getUserModel();

    if (enteredEmail.isNotEmpty && enteredPassword.isNotEmpty) {
      if (enteredEmail == retrievedUser?.email) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('User already exists'),
            content: Text('Go to login page?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())),
                child: Text('Yes'),
              ),
            ],
          ),
        );
      } else {
        final dynamic uuid = Uuid();
        final String userId = uuid.v4();
        log(userId.toString());
        UserModel user = UserModel(
          userId: userId,
          email: enteredEmail,
          password: enteredPassword,
        );
        SharedPreferencesUserHelper.saveUserModel(user);
        log(user.userId);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
            content: Text("User created successfully")));

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please fill in all fields.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
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
                // textField(
                //   prefixicon: const Icon(Icons.keyboard),
                //   text: "First Name",
                //   controller: firstNameController,
                //   valiDator: (value) {
                //     if (value!.length > 10) {
                //       return "Not >10 char";
                //     } else if (value.isEmpty) {
                //       return "Required";
                //     }
                //   },
                //   inputformatters: [
                //     FilteringTextInputFormatter.allow(RegExp(r"^[a-z A-Z]+$")),
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // textField(
                //   prefixicon: const Icon(Icons.keyboard),
                //   text: "Last Name",
                //   controller: lastNameController,
                //   valiDator: (value) {
                //     if (value!.length > 10) {
                //       return "Not >10 char";
                //     } else if (value.isEmpty) {
                //       return "Required";
                //     }
                //   },
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                textField(
                  prefixicon: const Icon(Icons.email),
                  text: "Email",
                  controller: usernameController,
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
                        handleSignUp();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("User created successfully")));

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
