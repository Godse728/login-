import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/bubble/swipe_page.dart';
import 'package:my_app/follower/Followers.dart';
import 'package:my_app/follower/followinglist.dart';
import 'package:my_app/form/forgetscreen.dart';
import 'package:my_app/form/form_bar.dart';
import 'package:my_app/form/login_bar.dart';
import 'package:my_app/form/signup_page.dart';
import 'package:my_app/screen/RowColomn.dart';
import 'package:my_app/screen/homepage.dart';
import 'package:my_app/stful_wid/bottom_nav.dart';
import 'package:my_app/stful_wid/stateful.dart';
import 'package:my_app/tiktokUI/tiktik.dart';
import 'package:my_app/tiktokUI/tiktok.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List screensList = [
      {"name": "Homepage", "widget": Homepage()},
      {"name": "followerslist", "widget": Followers()},
      {"name": "followinglist", "widget": Following()},
      {"name": "tiktokui", "widget": Tiktik()},
      {"name": "tiktok", "widget": Tiktok()},
      {"name": "Form", "widget": FormBar()},
      {"name": "swipeuppage", "widget": Swipe()},
      {"name": "Row", "widget": RowColomn()},
      {"name": "Navigationbar", "widget": NavBar()},
      {"name": "StopWatch", "widget": FullScreen()},
      {"name": "Login", "widget": LoginBar()},
      {"name": "Signup", "widget": SignupPage()},
      {"name": "ForgetScreen", "widget": ForgetScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
      ),
      body: ListView.builder(
          itemCount: screensList.length,
          itemBuilder: ((context, index) {
            final screen = screensList[index];
            return MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              height: 44,
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (context) => screen['widget']);
                Navigator.push(context, route);
              },
              color: Color.fromRGBO(Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255), 1),
              child: Text(
                screen["name"],
                style: TextStyle(color: Colors.white),
              ),
            );
          })),
    );
  }
}
