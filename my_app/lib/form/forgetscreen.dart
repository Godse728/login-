import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Screen', style: 
        TextStyle(color: Colors.white, fontSize: 22),),
      ),
      body: ListView(
        children: [
          Form(child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 159,
                    width: screenwidth,
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFwpI0TA1YXqGhZ2Y02CaizmZvetV9Nb8ckg&usqp=CAU',
                    fit: BoxFit.fill
                    ),
                  ),
                  Row(
                    children: [
                      Text('Forget Password', style:  TextStyle(color: Colors.blue,fontSize: 22),
                      ),
                    ],
                  )
                ],
              ),
              
          TextField(),
          TextField() ],
          ))
        ],
      ),
    );
  }
}