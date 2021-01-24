////import 'package:curved_navigation_bar/curved_navigation_bar.dart';
////import 'package:flutter/material.dart';
////import 'package:workshop/screens/home/home_api.dart';
////import 'package:workshop/screens/pages/page_one.dart';
////import 'package:workshop/screens/pages/page_three.dart';
////import 'package:workshop/screens/pages/page_two.dart';
////
////class NavigationPage extends StatefulWidget {
////  @override
////  _NavigationPageState createState() => _NavigationPageState();
////}
////
////class _NavigationPageState extends State<NavigationPage> {
////  int _currentIndex = 0;
////  final List<Widget> _children = [
////    Home(),
////    PageOne(),
////    PageTwo(),
////    PageThree()
////    // PageFive(),
////  ];
////  void onTappedBar(int index) {
////    setState(() {
////      _currentIndex = index;
////    });
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      bottomNavigationBar: CurvedNavigationBar(
////        // key: _buttonNavigationKey,
////        index: _currentIndex,
////        height: 50.0,
////        onTap: onTappedBar,
////        items: <Widget>[
////          Icon(
////            Icons.home,
////            size: 30,
////          ),
////          Icon(Icons.message, size: 30),
////          Icon(Icons.shopping_cart, size: 30),
////          Icon(Icons.account_box, size: 30),
////          // Icon(Icons.perm_identity, size: 30),
////        ],
////        color: Colors.white,
////        buttonBackgroundColor: Colors.white,
////        backgroundColor: Colors.blueAccent,
////        animationCurve: Curves.easeInOut,
////        animationDuration: Duration(milliseconds: 600),
////      ),
////      body: _children[_currentIndex],
////    );
////  }
////}
//
//import 'package:flutter/material.dart';
//import 'package:bmnav/bmnav.dart' as bmnav;
//import 'package:workshop/screens/home/home_api.dart';
//import 'package:workshop/screens/pages/page_one.dart';
//import 'package:workshop/screens/pages/page_three.dart';
//import 'package:workshop/screens/pages/page_two.dart';
//
//class NavagationPage extends StatefulWidget {
//  @override
//  _NavagationPageState createState() => _NavagationPageState();
//}
//
//class _NavagationPageState extends State<NavagationPage> {
//  int currentTab = 0;
//  final List<Widget> pages = [Home(), PageOne(), Admin(), Profile()];
//  Widget currentScreen = Home();
//
//  final PageStorageBucket bucket = PageStorageBucket();
//
//  @override
//  Widget build(BuildContext ctx) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: PageStorage(child: currentScreen, bucket: bucket),
//      bottomNavigationBar: bmnav.BottomNav(
//        index: currentTab,
//        //if you don't show text tab in bar set to false
//        labelStyle: bmnav.LabelStyle(visible: true, showOnSelect: true),
//        onTap: (i) {
//          setState(() {
//            currentTab = i;
//            currentScreen = pages[i];
//          });
//        },
//        items: [
//          bmnav.BottomNavItem(Icons.home, label: 'Home'),
//          bmnav.BottomNavItem(Icons.person_outline, label: 'Profile'),
//          bmnav.BottomNavItem(Icons.chat_bubble_outline, label: 'Chat'),
//          bmnav.BottomNavItem(Icons.person_outline, label: 'Profile')
//        ],
//        elevation: 0,
//      ),
//    );
//  }
//}
