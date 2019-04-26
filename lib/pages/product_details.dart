import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auction_app/pages/drawer.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final DateTime endingDate;

  const ProductDetails({Key key, this.title, this.endingDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: new Text(title)),
      ),
      drawer: Drawer(
        child: new Drawerr(),
      ),
      body: new Container(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: new Column(
          children: <Widget>[
            new Text(title, style: new TextStyle(fontSize: 20.0)),
            new Image.network(
              'http://pngimg.com/uploads/google/google_PNG19635.png',
            ),
            new Text('Ending Date: ${endingDate}')
          ],
        ),
      )),
    );
  }
}