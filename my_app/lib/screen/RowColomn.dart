// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';

import '../bubble/bubble.dart';
import '../bubble/userpost.dart';

class RowColomn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.add,
          size: 50,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Instagram',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.share_outlined,
            color: Colors.black,
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: 'reels'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'account'),
        ],
      ),
      body: Column(
        children: [
          // Stories
          Row(
            children: [
              BubbleStories(
                text: 'rame', ),
              BubbleStories(
                text: 'shame', ),
              BubbleStories(
                text: 'shere', ),
              BubbleStories(
                text: 'rajesh dai',),
              BubbleStories(
                text: 'meical_kaka', ),
            ],
          ),
          UserPosts(
            name: 'rame',
          ),
        ],
      ),
    );
  }
}
