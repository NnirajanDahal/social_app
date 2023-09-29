import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/helpers/user_helper.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/screens/mainscreen/pages/news_feed_screen.dart';
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
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isClicked = false;
  List<UserModel> userList = [];
  // bool _isLowercase = false;
  // bool _isOneDigit = false;
  // bool _isUpperCase = false;
  // bool _isOneSpecialCharacter = false;
  // bool _is8charactersLong = false;
  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('loggedIn') ?? false;

    if (loggedIn) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NewsFeedScreen()));
    }
  }

  handleLogin() async {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;
    UserModel? retrievedUser = await SharedPreferencesUserHelper.getUserModel();
    if (enteredUsername == retrievedUser?.email &&
        enteredPassword == retrievedUser?.password) {
      // Successful login
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      // log(retrievedUser!.userId);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NewsFeedScreen()));
    } else {
      //  Invalid credentials
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password.'),
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
  void initState() {
    checkLoginStatus();
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
                  controller: usernameController,
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

                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      handleLogin();
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
