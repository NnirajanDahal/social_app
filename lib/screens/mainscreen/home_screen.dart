import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_app/screens/mainscreen/pages/chat_screen.dart';
import 'package:social_app/screens/mainscreen/pages/news_feed_screen.dart';
import 'package:social_app/screens/mainscreen/pages/story_screen.dart';
import 'package:social_app/screens/mainscreen/pages/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const NewsFeedScreen(),
    const ChatScreen(),
    const StoriesScreen(),
    const UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Page"),
      // ),
      body: Center(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 80,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.chat_sharp),
            title: const Text('Chats'),
            activeColor: Colors.green,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.book),
            title: const Text('Stories'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person_2),
            title: const Text('Profile'),
            activeColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
