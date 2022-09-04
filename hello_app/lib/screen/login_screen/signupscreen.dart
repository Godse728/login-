import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Sign_UP_Screen extends StatefulWidget {
  Sign_UP_Screen({Key? key}) : super(key: key);

  @override
  State<Sign_UP_Screen> createState() => _Sign_UP_ScreenState();
}

class _Sign_UP_ScreenState extends State<Sign_UP_Screen> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  createUserWithFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(credential.toString());
      Fluttertoast.showToast(
          msg: "Successfully signed up!!. You can login in now.");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
      Fluttertoast.showToast(msg: "An error occured while signing up. ");
    } catch (e) {
      print(e);
    }
  }

  signupScreen() async {
    if (formKey.currentState != null) {
      formKey.currentState!.save();

      var isValid = formKey.currentState!.validate();
      if (isValid == true) {
        FocusScope.of(context).unfocus();
        createUserWithFirebase();
        setState(() {});
        //// login logic
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sign Up"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autofocus: false,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  print(val);
                },
                autocorrect: false,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required.'),
                  EmailValidator(errorText: 'E-mail must be valid'),
                ]),
                decoration: InputDecoration(
                    hintText: "Enter your email",
                    labelText: "E-mail",
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                autofocus: true,
                validator: MultiValidator([
                  RequiredValidator(
                      errorText: "Password must be of 8 characters")
                ]),
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
                    labelText: "PassWord",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: InkWell(
                        onTap: () {
                          hidePassword = !hidePassword;
                          setState(() {});
                        },
                        child: Icon(hidePassword == true
                            ? Icons.visibility
                            : Icons.visibility_off))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        signupScreen();
                      },
                      child: InkWell(onTap: () {}, child: Text("Sign Up")),
                      color: Colors.purple,
                      height: 33,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
