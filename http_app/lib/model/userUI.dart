// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_app/userpost.dart';

// import 'photoes.dart';

// class Userpost extends StatefulWidget {
//   Userpost({Key? key}) : super(key: key);

//   @override
//   State<Userpost> createState() => _UserpostState();
// }

// class _UserpostState extends State<Userpost> {
//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromServer();
//   }

//   List<Photos> photoes = [];
//   String bodytext = "this is body";
//   fetchDataFromServer() async {
//     print("fetching data from server");

//     final serverLocation =
//         "https://pixabay.com/api/?key=29447196-85201291d07d8d9b7000103ec&q=yellow+flowers&image_type=photo&pretty=true";

//     final uri = Uri.parse(serverLocation);
//     print("server url is $serverLocation");
// // GET
//     print("1. fetching value from server");
//     var response = http.get(uri);
//     response.then((res) {
//       print(res.statusCode);
//       bodytext = res.body;
//       final List decoded = json.decode(res.body);
//       // posts = decoded;
//       photoes = decoded
//           .map<Photos>((item) => Photos.convertFromJson(item)
//               //  {
//               //   final convertedItem = Post.covertJsonToPost(item);
//               //   return convertedItem;
//               // }
//               // )
//               )
//           .toList();
//       print("body text is ........:$bodytext");
//       setState(() {});
//     });
//     response.catchError((e) {
//       print(e);
//     });

//     try {
//       var response2 = await http.get(uri);
//       print(response2.statusCode);
//     } catch (e) {
//       print(e);
//     }
//     print("2:");
//   }

//   @override
//   Widget build(BuildContext context) {
//     var photoes2 = _photoes;
//     return Scaffold(
//         body: ListView.builder(
//           itemCount: photoes.length,
//       itemBuilder: (context, index) {
//         final Photos _photos = photoes[index];
//         return
//       }
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
                  
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(50),
//                     child: Image.network(
//                       'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//                       height: 50,
//                       width: 50,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   // Text(
//                   //   name,
//                   //   style: TextStyle(fontWeight: FontWeight.bold),
//                   // ),
//                 ],
//               ),
//               Icon(Icons.menu),
//             ],
//           ),
//         ),
//         Container(
//           child: Image.network(
//             'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//             fit: BoxFit.cover,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.favorite),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8),
//                     child: Icon(Icons.chat_bubble_outline),
//                   ),
//                   Icon(Icons.share),
//                 ],
//               ),
//               Icon(Icons.bookmark),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 16.0),
//           child: Row(
//             children: [
//               Text('Liked by '),
//               Text(
//                 ' rajesh dai ',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(' and '),
//               Text(
//                 'others',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(photoes2.user_id),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8, top: 4),
//           child: RichText(
//             text: TextSpan(
//               style: TextStyle(color: Colors.black),
//               children: [
//                 TextSpan(
//                     text: 'rajesh dai',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 TextSpan(
//                     text:
//                         ' ha ha ha ha bhai ko post ta ramro chha mai bata prerit bhako hola. Rajesh dai'),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }
