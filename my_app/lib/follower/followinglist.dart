import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Following extends StatelessWidget {
  List<String> friend = [
    'ram',
    'shyam',
    'hari',
    'jack',
    'john',
    'husky',
    'shere',
    'harke',
     'ram',
    'shyam',
    'hari',
    'jack',
    'john',
    'husky',
    'shere',
    'harke',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Followers', 
          style: TextStyle(
            fontSize: 16,
             fontWeight: FontWeight.bold),
             ),
          backgroundColor: Colors.blue,
          
        ),
        body: ListView.builder(
            itemCount: friend.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                      ),
                      ),
                      title: Text(friend[index],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      subtitle: Text('3 mutual friend'),
                      trailing: Container(child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Follow",
                         style: TextStyle(
                          fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                        textAlign: TextAlign.center,
                        ),
                      ),
                        height: 30,
                        width: 80,
                        
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        
                        ),
                      )),
                Divider(),
                ],
              );
            }),
            
            
            );
  }
}
