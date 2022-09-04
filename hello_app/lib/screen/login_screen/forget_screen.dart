import 'package:flutter/material.dart';

class Forget_Screen extends StatefulWidget {
  Forget_Screen({Key? key}) : super(key: key);

  @override
  State<Forget_Screen> createState() => _Forget_ScreenState();
}

class _Forget_ScreenState extends State<Forget_Screen> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forget Password?"),
        ),
        body: Form(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Forget password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                labelText: "E-mail",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter New Password",
                labelText: "New Password",
                prefixIcon: Icon(Icons.email),
                suffixIcon: InkWell(
                  onTap: () {
                    hidePassword = !hidePassword;
                    setState(() {});
                  },
                  child: Icon(hidePassword == true
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Conform Password",
                labelText: "Conform Password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: InkWell(
                  onTap: () {
                    hidePassword = !hidePassword;
                    setState(() {});
                  },
                  child: Icon(hidePassword == true
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
            )
          ],
        )));
  }
}
