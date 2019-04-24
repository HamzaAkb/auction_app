import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auction_app/pages/login.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: new Text('Khareedo'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('${user.email}',
                    style: new TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Divider(color: Colors.white),
              InkWell(
                child: ListTile(
                  title:
                      Text('Home', style: new TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
              ),
              InkWell(
                child: ListTile(
                  title: Text('Profile',
                      style: new TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
              ),
              InkWell(
                child: ListTile(
                  title: Text('Categories',
                      style: new TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
              ),
              InkWell(
                child: ListTile(
                  title: Text('Watching',
                      style: new TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
              ),
              InkWell(
                child: ListTile(
                  title: Text('History',
                      style: new TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                  },
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              InkWell(
                child: ListTile(
                  title: Text('Log Out',
                      style: new TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
