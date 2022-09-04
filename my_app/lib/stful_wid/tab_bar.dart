import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/follower/Followers.dart';
import 'package:my_app/follower/followinglist.dart';
import 'package:my_app/tiktokUI/tiktik.dart';

class BarTab extends StatefulWidget {
  const BarTab({Key? key}) : super(key: key);

  @override
  State<BarTab> createState() => _BarTabState();
}

class _BarTabState extends State<BarTab> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tab bar')),
        body: Column(
          children: [
            Container(
              height: 200,
              child: Center(child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network('https://cdn.pixabay.com/photo/2022/07/24/03/01/old-woman-7340874__340.jpg',
                  fit: BoxFit.cover),
                ),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                   shape: BoxShape.circle,
                   ),
              
              )),
            ),
            Container(
              height: 33,
              child: TabBar(
                  controller: controller,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Icon(Icons.dashboard_customize),
                     Icon(Icons.person)]),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                 
                   Tiktik(),

                  Following()
                  
                ],
              ),
            )
          ],
        ));
  }
}
