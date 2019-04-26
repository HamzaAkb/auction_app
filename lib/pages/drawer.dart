import 'package:auction_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:auction_app/pages/add_product.dart';

import 'package:auction_app/pages/show_search_category.dart';
import 'package:auction_app/pages/login.dart';
import 'package:auction_app/pages/show_products.dart';
import 'package:auction_app/pages/my_products.dart';

class Drawerr extends StatelessWidget {


  final FirebaseUser user;

  const Drawerr({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Hamza Akbar'),
              accountEmail: Text('hamzawakbar@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new Home(user: user,)),
              );
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                // IMPLEMENTATION.
              },
            ),
            ListTile(
              title: Text('My Bids'),
              onTap: () {},
            ),
            ListTile(
              title: Text('My Products'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new MyProducts(user: user,)),
              );
              },
            ),
            ListTile(
              title: Text('Categories'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new ShowSearchCategory(user: user,)),
              );
              },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {},
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: new Text('Log Out'),
              onTap: () {
                                Route route = MaterialPageRoute(builder: (context) => LoginPage());
                Navigator.pushReplacement(context, route);
              },
            ),
          ],
        )
      ;}
}