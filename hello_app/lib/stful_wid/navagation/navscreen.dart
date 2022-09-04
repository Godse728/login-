import 'dart:math';
import 'package:flutter/material.dart';
import '../../form/forgetscreen.dart';
import '../../form/form_bar.dart';
import '../../form/login_bar.dart';
import '../../form/signup_page.dart';
import '../../screen/RowColomn.dart';
import '../../screen/homepage.dart';
import '../../tiktokUI/tiktik.dart';
import '../../tiktokUI/tiktok.dart';
import '../bottom_nav.dart';
import '../bubble/swipe_page.dart';
import '../follower/Followers.dart';
import '../follower/followinglist.dart';
import '../stateful.dart';
import 'nav.dart';


class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key, this.pageTitle="login"}) : super(key: key);
   final String pageTitle;
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
                Navigator.pushNamed(context, "/hello");
              },
              color: Color.fromRGBO(Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255), 1),
              child: Text(
                screen["name"],
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          ),
          
          ),
          
    );
  }
}
