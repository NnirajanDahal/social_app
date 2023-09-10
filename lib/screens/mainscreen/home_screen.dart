import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/cubit/bottom_nav_cubit_cubit.dart';
import 'package:social_app/screens/mainscreen/pages/news_feed_screen.dart';
import 'package:social_app/screens/mainscreen/pages/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Widget> listScreen = [const NewsFeedScreen(), const UserProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: listScreen[state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (val) {
              context.read<BottomNavCubit>().onChanged(val);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
