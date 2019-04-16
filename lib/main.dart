import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Auction'),
          actions: <Widget>[
            // ADD Icon Display
            new IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white
              ),
              // FUNCTION to MAKE A NEW BID
              onPressed: (){},
            ),
            // SEARCH Icon Display
            new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white
              ),
              // Function to Implement SEARCH
              onPressed: (){},
            )
          ],
        ),
        drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // Header
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
                color: Colors.redAccent,
              ),
            ),
            // Body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Account'),
                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Current Bids'),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            InkWell(
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => new Cart()));
              // },
              child: ListTile(
                title: Text('History'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}