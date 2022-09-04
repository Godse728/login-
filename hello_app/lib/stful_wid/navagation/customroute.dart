import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../form/login_bar.dart';
import '../../form/signup_page.dart';
import '../../screen/homepage.dart';
import '../../tiktokUI/tiktik.dart';
import '../follower/Followers.dart';
import '../follower/followinglist.dart';
import 'nav.dart';


Route ourRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Routes.homepage:
      return MaterialPageRoute(builder: (_) => Homepage());
    case Routes.followers:
      return MaterialPageRoute(builder: (_) => Followers());
    case Routes.following:
      return MaterialPageRoute(builder: (_) => Following());
    case Routes.tiktok:
      return MaterialPageRoute(builder: (_) => Tiktik());
    case Routes.login:
      return MaterialPageRoute(builder: (_) => LoginBar());
    default:
      return MaterialPageRoute(builder: (_) => SignupPage());
  }
}
