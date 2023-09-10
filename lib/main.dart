import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/cubit/bottom_nav_cubit_cubit.dart';
// import 'package:social_app/screens/auth/login_screen.dart';
import 'package:social_app/screens/mainscreen/home_screen.dart';
import 'package:social_app/screens/splash_screen/splash%20screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const SplashScreen(),
      ),
    );
  }
}
