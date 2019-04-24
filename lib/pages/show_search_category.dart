import 'package:flutter/material.dart';

class ShowSearchCategory extends StatelessWidget {
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Hamza Akbar'),
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
              onTap: () {},
            ),
            ListTile(
              title: Text('Categories'),
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) => ShowSearchCategory());
                Navigator.pushReplacement(context, route);
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
              onTap: () {},
            ),
          ],
        ),
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
