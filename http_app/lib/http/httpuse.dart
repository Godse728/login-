import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentsUI extends StatefulWidget {
  CommentsUI({Key? key}) : super(key: key);

  @override
  State<CommentsUI> createState() => _CommentsUIState();
}

class _CommentsUIState extends State<CommentsUI> {
  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  String bodytext = "this is body";
  List comments = [];

  fetchDataFromServer() async {
    final serverLocation = "https://jsonplaceholder.typicode.com/comments";
    final uri = Uri.parse(serverLocation);
    // get
    var response = http.get(uri);
    response.then((res) {
      print(res.statusCode);
      bodytext = res.body;
      final List decoded = json.decode(res.body);
      comments = decoded;
      print("body text is....$bodytext");
      setState(() {});
    });
    response.catchError((e) {
      print(e);
    });

    try {
      var response2 = await http.get(uri);
      print(response2.statusCode);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final _comment = comments[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}." + _comment["email"],
                        style: TextStyle(
                          // color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(_comment["body"]),
                      Text(_comment["name"],
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20),)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
