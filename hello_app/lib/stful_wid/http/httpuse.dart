
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HelloHttp extends StatefulWidget {
  @override
  State<HelloHttp> createState() => _HelloHttpState();
}

class _HelloHttpState extends State<HelloHttp> {
  @override
  void initState() {
    super.initState();
  }

fetchDataFromServer() {
  final serverLocation = "Https://www.server.com";
  final uri = Uri.parse(serverLocation);
print("1. fetching value from server");
var response = http.get(uri);
response.then((value) {});
response.catchError((e) {});
print("2");
}
// GET

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http using"),
      ),
    );
  }
}
