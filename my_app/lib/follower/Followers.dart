
import 'package:flutter/material.dart';

class Followers extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Saurabh Dhital',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),),
          Icon(Icons.arrow_drop_down, color: Colors.black,),
           
              Padding(
                padding: const EdgeInsets.only(left:25.0),
                child: 
                    Icon(Icons.replay_sharp, color: Colors.black,),                                 
              ),
           
            Icon(Icons.bookmark_border, color: Colors.black,),
             Icon(Icons.list_alt_sharp, color: Colors.black,),
              Icon(Icons.account_circle_outlined, color: Colors.black,),
               Icon(Icons.horizontal_split, color: Colors.black,),
          
        ],
    
      ),
      backgroundColor: Colors.white,
    ),
    body: Column(
      children: [
        Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container( child: Image.network(
                      'https://img.freepik.com/premium-vector/joker-pistol-mascot-sports-esports-logo-vector-illustration_382438-151.jpg?w=2000',
                      
                      fit: BoxFit.fill,
                    ),
         height: 90,
         width: 90,
         decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
                   ),
      ),
      
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8,),
            child: Row(
              children: [
                Text(' 800\n Post',
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                Text('        6.66M\n        Followers',
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                Text('         573\n         Following',
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Padding(
              padding: const EdgeInsets.only(left:30.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: Text('FOLLOW',
               style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
              fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ),
                    height: 50,
                    width: 228,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      ),
                  ),
            ),
            Row(
              children: [Container(child: Icon(Icons.arrow_drop_down,
              color: Colors.white, size: 40,),
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,),
              )],
            )],    
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                        Text('Your bio goes here.... \n and here toooo\n', style: TextStyle(fontSize: 15),),
                      Text('\n \n saurabh dhital.com', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                      color: Colors.blue),),
                      ],),
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Icon(Icons.bento, size: 30,),
                  Icon(Icons.list_alt_sharp, size: 30,),
                  Icon(Icons.star_border_rounded, size: 30,),
                  Icon(Icons.account_box_outlined, size: 30,),
                  ]),
                  Container(child: Image.network('https://i.pinimg.com/550x/90/c9/d3/90c9d327f794b9e6be7c1dfc1aec8fa7.jpg',
                 height: 325,
                 width: 500,
                  fit: BoxFit.fill,),)
        ],
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
   );
  }


}