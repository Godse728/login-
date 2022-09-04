import 'package:flutter/material.dart';

class Tiktik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 32,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                color: Colors.white,
                size: 32,
              ),
              label: 'Discover'),
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
                size: 30,
              ),
              label: 'Inbox'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              label: 'Profile')
        ],
        backgroundColor: Colors.black,
        
      ),
      body: Stack(children: [
        Image.network(
            'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            fit: BoxFit.cover,
            height: screenHeight,
            width: screenWidth),
        Container(
            //color: Colors.black,
            ),
        Positioned(
          top: 50,
          left: 100,
          child: Container(
            height: 45,
            width: 225,
            //decoration: BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Following',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  Text(
                    'For You',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 40,
          child: Icon(
            Icons.live_tv_outlined,
            color: Colors.white,
            size: 44,
          ),
        ),
        Positioned(
          right: 30,
          top: 40,
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 44,
          ),
        ),
       
        // right icon.
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 90,
            height: 350,
            //color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 3, bottom: 3),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network('https://cdn.pixabay.com/photo/2022/01/23/16/06/dog-6961236__340.jpg',
                        fit: BoxFit.cover,),
                      ),
                      
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, 
                          color: Colors.blue
                          ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 40,
                      
                    ),
                    Icon(
                      Icons.insert_comment_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    Icon(
                      Icons.bookmark_add_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //color: Colors.pink
                      ),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.black
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            height: 125,
            width: 300,
            // color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16),
              child: RichText(
                text: TextSpan(
                    text: 'Rajesh Dai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                          text:
                              '\nha ha ha ha mero bhai haru lai yo sano tasbir.',
                          style: TextStyle(color: Colors.white, fontSize: 18))
                    ]),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 30,
              width: 250,
              //color: Colors.red,
              child: Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              alignment: Alignment.topLeft,
            )),
            Positioned(
              top: 280,
              right: 22,
              child: Container(
              height: 20,
              width: 20,
              child: Center(
                child: Icon(Icons.add, 
                size: 22,
                color: Colors.white,),
              ),
              decoration: BoxDecoration(color: Colors.pinkAccent,
              shape: BoxShape.circle),
            ))
      ]),
    );
  }
}
