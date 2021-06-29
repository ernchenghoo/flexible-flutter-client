
import 'package:flexible_flutter_client/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Divider(color: Colors.transparent, height: 100,),
            Container(
              width: 140,
              height: 140,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/house.json',
                ),
              ),
            ),
            Divider(color: Colors.transparent, height: 80),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            LoginForm()
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<LoginForm>.
  final _formKey = GlobalKey<FormState>();
  final authenticationService = AuthenticationService();
  String _email;
  String _password;

  Future<void> login() async {
    bool loginSuccess = await authenticationService.login(_email, _password);
    if (loginSuccess) {
      Scaffold.of(context).hideCurrentSnackBar();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter an email';
                      }
                      else {
                        _email = value;
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                      // border: InputBorder.none,
                      // focusedBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      // errorBorder: InputBorder.none,
                      // disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Please enter your email"),
                  ),
                  Divider(color: Colors.transparent, height: 10,),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a password';
                      }
                      else {
                        _password = value;
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                      // border: InputBorder.none,
                      // focusedBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      // errorBorder: InputBorder.none,
                      // disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Please enter your password"),

                  ),
                  Divider(color: Colors.transparent, height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {

                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Logging in')));
                        login();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ]
            )
        ),
      ),
    );
  }
}
