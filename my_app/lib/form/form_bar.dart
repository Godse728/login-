import 'package:flutter/material.dart';

class FormBar extends StatefulWidget {
  FormBar({Key? key}) : super(key: key);

  @override
  State<FormBar> createState() => _FormBarState();
}

class _FormBarState extends State<FormBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill up the form'),
      ),
      body: Column(
        children: [
          TextField(
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Enter your name.',
              hintStyle: TextStyle(
                color: Colors.blue,
              ),
              prefixIcon: Icon(Icons.text_fields),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Enter your email.',
                hintStyle: TextStyle(color: Colors.redAccent)),
          )
        ],
      ),
    );
  }
}
// bottomNavigationBar: Container(
//         child: AnimatedBottomNavigationBar(
//           backgroundColor: Colors.black,
//           iconSize: 20,
//           notchMargin: 5,
//           notchSmoothness: NotchSmoothness.verySmoothEdge,
//           activeColor: Colors.blue,
//           inactiveColor: Colors.grey,
//           gapLocation: GapLocation.center,
//           icons: iconList,
//           activeIndex: _currentIndex,
//           onTap: (index) {
//             _currentIndex = index;
//             setState(() {});
//           },
//         ),
//       ),

