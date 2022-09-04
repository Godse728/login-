import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hello_app/screen/login_screen/forget_screen.dart';
import 'package:hello_app/screen/login_screen/sharedpref.dart';
import 'package:hello_app/screen/login_screen/signupscreen.dart';
import 'package:hello_app/stful_wid/follower/Followers.dart';
import 'package:hello_app/stful_wid/navagation/nav.dart';


class Login_Screen extends StatefulWidget {
  Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
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

  navigate() async {
    await SharedPref.setHasUserLoggedIn(true);
    Navigator.push(context, MaterialPageRoute(builder: (a) => Followers()));
  }

  loginWithFirebase() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(credential.toString());
      Fluttertoast.showToast(msg: "Login In Successfull!!! (:");
      await SharedPref.setHasUserLoggedIn(true);
      navigate();
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
      Fluttertoast.showToast(
          msg: e.message ?? "An error occured while signing in. ");
    } catch (e) {
      print(e);
    }
  }

  login() {
    final email = emailController.text;
    print('email is $email');
    final password = passwordController.text;
    print('password is $password');
    if (formKey.currentState != null) {
      formKey.currentState!.save();
      bool isValid = formKey.currentState!.validate();

      if (isValid == true) {
        /// Login logic.
        FocusScope.of(context).unfocus();
        loginWithFirebase();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              autofocus: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) {
                print(val);
              },
              autocorrect: false,
              validator: MultiValidator([
                RequiredValidator(errorText: "Email is required."),
                EmailValidator(errorText: "Email must be valid."),
              ]),
              //  (val) {
              //   if (val == null) {
              //     return "Email mustn't be null";
              //   }
              //   if (!val.contains("@")) {
              //     return "Enter a valid Email.";
              //   }
              // },
              decoration: InputDecoration(
                hintText: 'Enter Your E-mail.',
                hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
                labelText: "E-mail",
                labelStyle: TextStyle(fontSize: 20),
                suffixIcon: Icon(Icons.email),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: MultiValidator([
                RequiredValidator(errorText: "Password is required."),
                MinLengthValidator(8,
                    errorText: "Password must be 8 characters.")
              ]),

              controller: passwordController,
              autofocus: false,
              obscureText: hidePassword,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onChanged: (val) {
                print(val);
              },
              //onSubmitted: (val) {},
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Enter Your Password.',
                hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.green),
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (a) => Forget_Screen()));
                  },
                    child: Text('Forget Password?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ],
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                //side: BorderSide(color: Colors.purple),
              ),
              color: Colors.blue,
              height: 40,
              minWidth: 150,
              onPressed:login
              ,
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InkWell(
              child: Text(
                "Don't have an account? Sign Up",
                textAlign: TextAlign.left,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (a) => Sign_UP_Screen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
