
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tiktok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              label: 'Friends'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 64,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox,
                color: Colors.white,
              ),
              label: 'Inbox'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profile')
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.live_tv,
                  size: 44,
                ),
                Text('Following', style: GoogleFonts.abel()),
                Text('For You',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Icon(
                  Icons.search,
                  size: 44,
                )
              ],
            ),
            height: 100,
            color: Colors.red,
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
              Container(
                width: 100,
                color: Colors.purple,
                child: Column(
                  children: List<Widget>.generate(
                      5,
                      (_) => Container(
                            width: 60,
                            height: 60,
                            color: Colors.blue,
                            margin: EdgeInsets.only(top: 20),
                          )),
                ),
              ),
            ],
          )),
          Container(
            child: Container(
              child: Text(
                'hello',
                style: GoogleFonts.abel(),
              ),
            ),
            height: 80,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
