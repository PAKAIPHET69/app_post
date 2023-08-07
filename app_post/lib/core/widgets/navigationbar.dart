import 'package:app_post/features/post/presentation/pages/add_post_page.dart';
import 'package:app_post/features/search/persentitioon/pages/search_page.dart';
import 'package:app_post/features/screens/home_screen.dart';
import 'package:app_post/features/screens/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        height: 60,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Colors.white),
            icon: Icon(Icons.search_outlined, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_circle, color: Colors.white),
            icon: Icon(Icons.add, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.white),
            icon: Icon(Icons.person_outlined, color: Colors.white),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        const SearchPage(),
        const AddPostPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
