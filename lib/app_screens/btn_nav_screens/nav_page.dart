import 'package:flutter/material.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:workshop/app_screens/btn_nav_screens/search.dart';
import 'package:workshop/app_screens/btn_nav_screens/feed.dart';
import 'package:workshop/app_screens/btn_nav_screens/page_one.dart';
import 'package:workshop/app_screens/btn_nav_screens/profile.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentTab = 0;
  final List<Widget> pages = [
    Feed(),
    SearchScreen(),
    AddProducts(),
    ProfileScreen()
  ];
  Widget currentScreen = Feed();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(child: currentScreen, bucket: bucket),
      bottomNavigationBar: bmnav.BottomNav(
        index: currentTab,
        //if you don't show text tab in bar set to false
        labelStyle: bmnav.LabelStyle(visible: true, showOnSelect: true),
        onTap: (i) {
          setState(() {
            currentTab = i;
            currentScreen = pages[i];
          });
        },
        items: [
          bmnav.BottomNavItem(Icons.home, label: 'Home'),
          bmnav.BottomNavItem(Icons.search, label: 'Search'),
          bmnav.BottomNavItem(Icons.chat_bubble_outline, label: 'Chat'),
          bmnav.BottomNavItem(Icons.person_outline, label: 'Profile')
        ],
        elevation: 0,
      ),
    );
  }
}
