import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/model/postmo.dart';

void main() {}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
  bool hasErrorOccured = false;
  String errorMessage = '';
  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  String bodytext = "this is body";
  List<Post> posts = [];
  List<Post> items = [
    Post(userId: 1, id: 2, title: "hello", body: "ssfsd"),
    Post(userId: 2, id: 3, title: "And", body: "dff"),
    Post(userId: 3, id: 3, title: "welcome", body: "fsf"),
    Post(userId: 4, id: 1, title: "to", body: "efF")
  ];
  fetchDataFromServer() async {
    print("fetching data from server");

    final post = items[0];
    final serverLocation = "https://jsonplaceholder.typicode.com/posts";

    final uri = Uri.parse(serverLocation);
    print("server url is $serverLocation");
// GET
    print("1. fetching value from server");
    isLoading = true;
    setState(() {});
    var response = http.get(uri);
    response.then((res) {
      print(res.statusCode);
      bodytext = res.body;
      final List decoded = json.decode(res.body);
      // posts = decoded;
      posts = decoded
          .map<Post>((item) => Post.covertJsonToPost(item)
              //  {
              //   final convertedItem = Post.covertJsonToPost(item);
              //   return convertedItem;
              // }
              // )
              )
          .toList();
      print("body text is ........:$bodytext");
      isLoading = false;
      setState(() {});
    });
    response.catchError((e) {
      isLoading = false;
      hasErrorOccured = true;
      errorMessage = e.toString();
      print(e);
    });

    try {
      var response2 = await http.get(uri);
      print(response2.statusCode);
    } catch (e) {
      print(e);
    }
    print("2:");
  }

  postSomethingToServer() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.post(
      uri,
      body: {"email": "email", "password": "password"},
      headers: {
        "accept": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    setState(() {});
  }

  Widget buildList() {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final Post _post = posts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}." + _post.title,
                    style: TextStyle(
                      // color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(_post.body),
                ],
              ),
            ),
          );
        });
  }
  Widget buildBody() {
    if(isLoading) {
      return CircularProgressIndicator();
    }
    if(hasErrorOccured) {
      return Text(errorMessage);
    }
    return buildList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        floatingActionButton: FloatingActionButton(onPressed: () {
          postSomethingToServer();
        }),
        body: Center(
         child:  buildBody(),
        ));
  }
}
