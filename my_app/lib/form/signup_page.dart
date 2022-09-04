import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool hidePassword = true;
  final emaillController = TextEditingController();
  final passworddController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Form(
          child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 159,
                width: screenWidth,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6fchJaT--mKz-xP4rAiAbvZMahhgiGpZQUA&usqp=CAU',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: true,
            controller: emaillController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) {
              print(val);
            },
            autocorrect: false,
            validator: MultiValidator([
              RequiredValidator(errorText: 'E-mail is required.'),
              EmailValidator(errorText: 'E-mail must be valid'),
            ]),
            decoration: InputDecoration(
              hintText: 'Enter Your E-mail.',
              hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
              labelText: "E-mail",
              labelStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: true,
            controller: passworddController,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (val) {
              print(val);
            },
            autocorrect: false,
            validator: MultiValidator([
              RequiredValidator(errorText: 'enter minimum 8 character'),
            ]),
            decoration: InputDecoration(
                hintText: 'Enter password.',
                hintStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.password),
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
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            //side: BorderSide(color: Colors.purple),
          ),
          color: Colors.blue,
          height: 44,
          minWidth: 150,
          onPressed: () {},
          child: Text(
            'Sign up',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('go back'),
          ),
        )
      ])),
    ));
  }
}
