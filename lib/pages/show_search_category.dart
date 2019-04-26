import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:auction_app/pages/drawer.dart';

class ShowSearchCategory extends StatelessWidget {

  final FirebaseUser user;

  const ShowSearchCategory({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: new Center(
          child: new Text('Search'),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: new Drawerr(user:user),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Center(
                child: new Text('CATEGORIES',
                    style: new TextStyle(fontSize: 20.0))),
          ),
          Divider(
            color: Colors.black,
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Books', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Cameras', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Clothing', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Cell Phones', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Computers', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Electronics', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Sports', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
          new Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Text('Video Games', style: new TextStyle(fontSize: 20.0)),
            ),
          ),
        ],
      ),
    );
  }
}
