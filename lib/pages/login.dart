import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auction_app/pages/home.dart';
import 'package:auction_app/pages/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter an Email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: new InputDecoration(
                    labelText: "Email",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter a Password';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: new InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: new ButtonTheme(
                minWidth: double.infinity,
                buttonColor: Colors.black,
                height: 50,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)),
                  onPressed: signIn,
                  child: new Text(
                    'Login',
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Center(
                              child: new Text(
                  'Other Options',
                  style: new TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: new ButtonTheme(
                minWidth: double.infinity,
                buttonColor: Colors.black,
                height: 50,
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0)),
                    child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                    onPressed: () {}),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: new ButtonTheme(
                minWidth: double.infinity,
                buttonColor: Colors.black,
                height: 50,
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0)),
                    child: new Text(
                      'Sign Up',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      // TODO login to firebase
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        //TODO: Navigate to home
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => new Home(user: user,)));
      } catch (e) {
        print(e);
      }
    }
  }
}