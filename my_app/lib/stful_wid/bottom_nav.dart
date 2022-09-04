import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/follower/Followers.dart';
import 'package:my_app/follower/followinglist.dart';
import 'package:my_app/stful_wid/tab_bar.dart';
import 'package:my_app/tiktokUI/tiktik.dart';

class NavBar extends StatefulWidget {
   //const NavBar({Key? key,) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int pressCount = 0;
  int _btmNavBarIndex = 0;
  var flIcon = Icons.dark_mode;
  var hereColor = Colors.white;
  var themData = ThemeData.light();
  var btmColor = Color.fromARGB(255, 117, 106, 106);
  List itemList = [
    Icons.home,
    Icons.home,
    Icons.home,
    Icons.home,
  ];
  List functionList = [
    Tiktik(),
    Followers(),
    Following(),
    BarTab(),
  ];

  void _themeChanger() {
    pressCount++;
    if (pressCount % 2 == 0) {
      setState(() {
        themData = ThemeData.light();
        // bodyColor = Colors.white;
        hereColor = Colors.black;
        btmColor = Color.fromARGB(255, 241, 241, 241);
        flIcon = Icons.dark_mode;
      });
    } else {
      setState(() {
        themData = ThemeData.dark(); // bodyColor = Colors.black;
        hereColor = Colors.white;
        btmColor = Color.fromARGB(255, 34, 34, 34);
        flIcon = Icons.light_mode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(hereColor);
    return Theme(
      data: themData,
      child: Scaffold(
        // backgroundColor: hereColor,
        body: Container(
          child: functionList.elementAt(_btmNavBarIndex),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          foregroundColor: hereColor,
          child: Icon(flIcon),
          backgroundColor: btmColor,
          splashColor: Colors.orange,
          hoverColor: Colors.red,
          focusColor: Colors.red,
          autofocus: true,
          elevation: 10,
          highlightElevation: 6,
          isExtended: true,
          onPressed: _themeChanger,
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
            hideAnimationCurve: Curves.bounceInOut,
            splashColor: Colors.orange,
            activeColor: Colors.red,
            inactiveColor: hereColor,
            backgroundColor: btmColor,
            gapLocation: GapLocation.center,
            notchMargin: 10,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            icons: [
              Icons.home,
              Icons.bookmark,
              Icons.saved_search,
              Icons.person,
            ],
            activeIndex: _btmNavBarIndex,
            onTap: (index) {
              print("pressed");
              setState(() {
                _btmNavBarIndex = index;
              });
            }),
      ),
    );
  }
}