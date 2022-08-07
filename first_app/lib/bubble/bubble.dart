import 'package:flutter/material.dart';

class BubbleStories extends StatelessWidget {
  final String text;
  BubbleStories({required this.text,
 
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(text),
        ],
      ),
      
    );
  }
}
