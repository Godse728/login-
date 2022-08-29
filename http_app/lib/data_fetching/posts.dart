import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/hitlist.dart';

class DataFetchInstaPost extends StatefulWidget {
  const DataFetchInstaPost({Key? key}) : super(key: key);

  @override
  State<DataFetchInstaPost> createState() => _DataFetchInstaPostState();
}

class _DataFetchInstaPostState extends State<DataFetchInstaPost> {
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  // String bodyText = "this is body";
  List<Hits> posts = [];

  fetchDataFromServer() async {
    final serverLocation =
        "https://pixabay.com/api/?key=17082254-e9c4d9fe859875b824e271a7a&q=yellow+flowers&image_type=photo&pretty=true";

    final uri = Uri.parse(serverLocation);
    print("$serverLocation");
    var response = http.get(uri);
    setState(() {});
    response.then((res) {
      print(res.statusCode);
      final decoded = json.decode(res.body)['hits'];
      posts = decoded.map<Hits>((item) {
        final convertedItem = Hits.covertPostsFromJson(item);
        return convertedItem;
      }).toList();
      print(res.body);
      setState(() {});
    });
    response.catchError((e) {
      print(e);
      setState(() {});
    });

    // try {
    //   final response2 = await http.get(uri);
    //   print(response2.statusCode);
    // } catch (e) {
    //   print(e);
    // }
    // print("2");
  }

  // favTap() {
  //   isFavTapped = !isFavTapped;

  //   if (isFavTapped) {
  //     iconType = Icons.favorite;
  //     favColor = Colors.red;
  //     setState(() {});
  //   } else {
  //     favColor = Colors.black;
  //     iconType = Icons.favorite_border_outlined;
  //     setState(() {});
  //   }
  // }

  ScrollController controllerscroll = ScrollController();

  changeColor() {
    Icon(
      Icons.favorite_border_outlined,
      color: Colors.pink,
      size: 35
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.pacifico(
              fontStyle: FontStyle.italic,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black45),
          // TextStyle(fontSize: 22,
          // fontWeight: FontWeight.bold,
          // ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final Hits _hits = posts[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              _hits.userImageURL,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _hits.user,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(Icons.menu),
                    ],
                  ),
                ),
                Container(
                  child: Image.network(
                    _hits.largeImageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 35,
                            ),
                            onTap: () {
                              changeColor();
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.chat_bubble_outline),
                          ),
                          Icon(Icons.share),
                        ],
                      ),
                      Icon(Icons.bookmark),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Text('Liked by '),
                      Text(
                        ' rajesh dai ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(' and '),
                      Text(
                        'others',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'rajesh dai',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                ' ha ha ha ha bhai ko post ta ramro chha mai bata prerit bhako hola. Rajesh dai'),
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 1,
                color: Colors.grey,)
              ],
            );
          }),
    );
  }
}
