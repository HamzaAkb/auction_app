import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auction_app/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password, _fullName, _confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter Your Name';
                  }
                },
                onSaved: (input) => _fullName = input,
                decoration: new InputDecoration(
                  labelText: "Name",
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter Your Email';
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter Your Password';
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter Your Password';
                  }
                },
                onSaved: (input) => _confirmPassword = input,
                decoration: new InputDecoration(
                  labelText: "Confirm Password",
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
                    child: new Text(
                      'Sign Up',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: signUp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<FirebaseUser> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      // TODO login to firebase
      if (_password == _confirmPassword) {
        try {
          FirebaseUser user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          
          Firestore.instance.collection('user').document()
          .setData({ 'name': _fullName, 'id': user.uid, 'email': _email});

          //TODO: Navigate to home
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => new LoginPage()));
        } catch (e) {
          print(e);
        }
      } else{
        _showDialog();
      }
    }
  }

    void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Try Again"),
          content: new Text("Password Don't Match"),
        );
      },
    );
  }

}
