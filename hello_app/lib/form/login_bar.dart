import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../tiktokUI/tiktik.dart';
import 'signup_page.dart';

class LoginBar extends StatefulWidget {
  LoginBar({Key? key}) : super(key: key);

  @override
  State<LoginBar> createState() => _LoginBarState();
}

class _LoginBarState extends State<LoginBar> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 145,
                    width: screenWidth,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM_ECXV-qZ59aCg_jijaF5jHXliTBULTt0Ii6Ue6SwhO1vrTT12giH5Oj5v9tVJhKwM5Q&usqp=CAU',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
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
              Padding(
                padding: const EdgeInsets.only(top:8.0, left:8, right:8),
                child: TextFormField(
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Colors.green),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:4.0, left:4, right:4),
                child: TextFormField(
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
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
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 6, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text('Forget Password?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    //side: BorderSide(color: Colors.purple),
                  ),
                  color: Colors.blue,
                  height: 40,
                  minWidth: 150,
                  onPressed: () {
                    final email = emailController.text;
                    print('email is $email');
                    final password = passwordController.text;
                    print('password is $password');
                    if (formKey.currentState != null) {
                      formKey.currentState!.save();
                      bool isValid = formKey.currentState!.validate();

                      if (isValid == true) {
                        /// Login logic.
                        Navigator.push(context,
                            MaterialPageRoute(builder: (a) => Tiktik()));
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('OR', style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: .0, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'sign up with',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  //side: BorderSide(color: Colors.purple),
                ),
                color: Colors.blue,
                height: 33,
                minWidth: 300,
                child: Icon(Icons.facebook),
              ),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  //side: BorderSide(color: Colors.purple),
                ),
                color: Colors.blue,
                height: 33,
                minWidth: screenWidth,
                child: Icon(Icons.whatsapp),
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: Text('Register'),
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
