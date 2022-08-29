import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'photoes.dart';

class Insta_UI extends StatefulWidget {
  Insta_UI({Key? key}) : super(key: key);

  @override
  State<Insta_UI> createState() => _Insta_UIState();
}

class _Insta_UIState extends State<Insta_UI> {
  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  // String bodytext = "this is body";
  List<Photos> posts = [];

  fetchDataFromServer() async {
    final serverLocation =
        "https://pixabay.com/api/?key=29447196-85201291d07d8d9b7000103ec&q=yellow+flowers&image_type=photo&pretty=true";
    final uri = Uri.parse(serverLocation);
    print("server url is $serverLocation");
    setState(() {});
    var response = http.get(uri);
    response.then((res) {
      print(res.statusCode);
      
      //print(res.body);
      final decoded = json.decode(res.body)['hits'];

      posts = decoded.map<Photos>((item) {
        final convertedItem = Photos.ConvertJsonToPhotos(item);
        return convertedItem;
      }).toList();
      // print("bodytext is .... $bodytext");
      setState(() {});
    });
    response.catchError((e) {
      print(e);
    });
    // try {
    //   var response2 = await http.get(uri);
    //   print(response2.statusCode);
    // } catch (e) {
    //   print(e);
    // }
  }

  Widget buildList() {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: ((context, index) {
          final Photos _hits = posts[index];
          return Container(
            height: 200,
            color: Colors.amber,
            child: Text(
              _hits.user,
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildList(),
    );
  }
}
